//
//  FaceComparisonVC.m
//  Baisi
//
//  Created by dqong on 2017/7/11.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FaceComparisonVC.h"
#import "SureCustomActionSheet.h"
#import "MyPhotoCameraVC.h"
@interface FaceComparisonVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,cameraDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *LeftImage;
@property (weak, nonatomic) IBOutlet UIImageView *RightImage;
@property (weak, nonatomic) IBOutlet UIButton *LeftAddBtn;
@property (weak, nonatomic) IBOutlet UIButton *RightAddBtn;
@property (weak, nonatomic) IBOutlet UILabel *SimilarLabel;
@property (weak, nonatomic) IBOutlet UIButton *BeginBtn;

@end

@implementation FaceComparisonVC
{
    UIImagePickerController * _imagePickerController;
    NSNumber * _ImageType;
    NSString * _accessToken;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"人脸比对";
    
    _imagePickerController = [UIImagePickerController new];
    _imagePickerController.delegate = self;
    _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    _imagePickerController.allowsEditing = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_accessToken == nil) {
        _accessToken = [self getToken];
    }

}
//左边添加图片
- (IBAction)leftAddbtnClick:(UIButton *)sender {
    [self addImageMethod];
    _ImageType = @1;
    
}
//右边添加图片
- (IBAction)rightAddBtnClick:(UIButton *)sender {
    [self addImageMethod];
    _ImageType = @2;
    
}
- (IBAction)beginBtnClick:(UIButton *)sender {
    sender.enabled = NO;
    [SVProgressHUD showWithStatus:@"正在对比"];
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"access_token"] = _accessToken;
    NSData * imageData1 = UIImageJPEGRepresentation(self.LeftImage.image, 0.5);
    NSData * imageData2 = UIImageJPEGRepresentation(self.RightImage.image, 0.5);
    params[@"images"]= [NSString stringWithFormat:@"%@,%@",[imageData1 base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)],[imageData2 base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)]];
    [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/match" refreshCache:YES params:params success:^(id response) {
        ZYLog(@"对比成功 == %@",response);
        sender.enabled = YES;
        if (response[@"error_code"] == nil) {
            [SVProgressHUD dismiss];
            NSArray * result = [response objectForKey:@"result"];
            if (result.count != 0) {
              weakSelf.SimilarLabel.text = [NSString stringWithFormat:@"相似度: %@",[result[0] objectForKey:@"score"]];
            }
            
        }else{
            [SVProgressHUD showErrorWithStatus:@"对比失败"];
            weakSelf.SimilarLabel.text = [NSString stringWithFormat:@"错误码%@ -- msg:%@",response[@"error_code"],response[@"error_msg"]];
            
        }
    } fail:^(NSError *error) {
        sender.enabled = YES;
        ZYLog(@"err == %@",error);
        [SVProgressHUD showErrorWithStatus:@"对比失败"];
    }];

    
    
}
#pragma mark - 获取token
- (NSString *)getToken{
    
    [SVProgressHUD showWithStatus:@"获取token"];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"grant_type"] = @"client_credentials";
    params[@"client_id"] = @"h2eDo30k0Dah5NwdAAfOjGp0";
    params[@"client_secret"] = @"NbGZtGUY35gnSqExTAnFxjKLziiwGoSs";
    
    [HYBNetworking getWithUrl:@"https://aip.baidubce.com/oauth/2.0/token" refreshCache:YES params:params success:^(id response) {
        
        _accessToken = response[@"access_token"];
        [SVProgressHUD dismiss];
        
        
    } fail:^(NSError *error) {
        
        ZYLog(@"失败 == %@",error);
        ZYLog(@"失败code = %ld",(long)error.code);
        _accessToken = nil;
        [SVProgressHUD showErrorWithStatus:@"token获取失败"];
    }];
    return _accessToken;
}

#pragma mark - imageDelegate
//相册回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    if ([_ImageType isEqualToNumber:@1]) {
        self.LeftImage.image = info[UIImagePickerControllerEditedImage];
    }else{
        self.RightImage.image = info[UIImagePickerControllerEditedImage];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//相机回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        if ([_ImageType isEqualToNumber:@1]) {
            self.LeftImage.image = image;
        }else{
            self.RightImage.image = image;
        }

    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - 自定义camera代理
- (void)getPicture:(UIImage *)img{
    if ([_ImageType isEqualToNumber:@1]) {
        self.LeftImage.image = img;
    }else{
    
        self.RightImage.image = img;
    }

}
#pragma mark - 添加图片方法
- (void)addImageMethod{

    SureCustomActionSheet * optionView = [[SureCustomActionSheet alloc]initWithTitleView:nil optionsArr:@[@"相册",@"相机"] cancelTitle:@"取消" selectedBlock:^(NSInteger index) {
        switch (index) {
            case 0:
            {
                //相册
                _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:_imagePickerController animated:YES completion:^{
                    [[UIApplication sharedApplication] setStatusBarHidden:NO];
                     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
                }];
            }
                break;
            case 1:
            {
                //相机
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    MyPhotoCameraVC * mycamera = [MyPhotoCameraVC new];
                    mycamera.delegate = self;
                    [self presentViewController:mycamera animated:YES completion:nil];
//                    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
//                    [self presentViewController:_imagePickerController animated:YES completion:nil];
                }else{
                    [SVProgressHUD showErrorWithStatus:@"相机不可用"];
                    
                }
                
            }
                break;
            default:
                break;
        }
        
    } cancelBlock:^{
        ZYLog(@"取消了");
    }];
    
    [self.view addSubview:optionView];

}
@end
