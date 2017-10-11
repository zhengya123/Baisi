//
//  FaceRecogintionVC.m
//  Baisi
//
//  Created by dqong on 2017/7/11.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FaceRecogintionVC.h"
#import "SureCustomActionSheet.h"
@interface FaceRecogintionVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIButton *UpLoadImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *CompareBtn;
@property (weak, nonatomic) IBOutlet UIButton *CheckBtn;
@property (weak, nonatomic) IBOutlet UIButton *SelectBtn;
@property (weak, nonatomic) IBOutlet UILabel *similarLabel;


@end

@implementation FaceRecogintionVC
{
    NSString * _accessToken;
    UIImagePickerController * _imagePickerController;

}
- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"人脸识别";
    
    _imagePickerController = [UIImagePickerController new];
    _imagePickerController.delegate = self;
    _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    _imagePickerController.allowsEditing = YES;
}
//上传
- (IBAction)uploadImage:(UIButton *)sender {
    if (_accessToken == nil) {
        _accessToken = [self getAccessToken];
        [self uploadImag:[self getAccessToken] groupid:@"threeGroup" img:self.imageV.image];
    }else{
        [self uploadImag:_accessToken groupid:@"threeGroup" img:self.imageV.image];
    
    }
    
}
//比较
- (IBAction)compare:(UIButton *)sender {
    if (_accessToken == nil) {
        _accessToken =[self getAccessToken];
         [self compareImage:[self getAccessToken] GroupID:@"threeGroup" img:self.imageV.image];
    }else{
    
     [self compareImage:_accessToken GroupID:@"threeGroup" img:self.imageV.image];
    }
   
    
}
//检查
- (IBAction)check:(UIButton *)sender {
    if (_accessToken == nil) {
        _accessToken =[self getAccessToken];
        [self checkImage:[self getAccessToken]];
    }else{
        
        [self checkImage:_accessToken];
    }

    
}
//选择图片
- (IBAction)selectBtnMethod:(UIButton *)sender {

    SureCustomActionSheet * optionView = [[SureCustomActionSheet alloc]initWithTitleView:nil optionsArr:@[@"相册",@"相机"] cancelTitle:@"取消" selectedBlock:^(NSInteger index) {
        switch (index) {
            case 0:
            {
                //相册
                    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    [self presentViewController:_imagePickerController animated:YES completion:nil];
            }
                break;
            case 1:
            {
                //相机
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:_imagePickerController animated:YES completion:nil];
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

#pragma mark - imageDelegate
//相册回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
  
   // NSString * mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    //if ([mediaType isEqualToString:(NSString *)kCIAttributeTypeImage]) {
        self.imageV.image = info[UIImagePickerControllerEditedImage];
   // }
    [self dismissViewControllerAnimated:YES completion:nil];
}
//相机回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        self.imageV.image = image;
    }
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];

}
#pragma mark - 获取token
- (NSString *)getAccessToken{
    
               [SVProgressHUD showWithStatus:@"获取token"];
                NSMutableDictionary * params = [NSMutableDictionary dictionary];
                params[@"grant_type"] = @"client_credentials";
                params[@"client_id"] = @"h2eDo30k0Dah5NwdAAfOjGp0";
                params[@"client_secret"] = @"NbGZtGUY35gnSqExTAnFxjKLziiwGoSs";
    
                [HYBNetworking getWithUrl:@"https://aip.baidubce.com/oauth/2.0/token" refreshCache:YES params:params success:^(id response) {
    
                    _accessToken = response[@"access_token"];
                    [SVProgressHUD dismiss];
                    self.similarLabel.text = @"除检查外，其余请选取图片进行操作";
                    
                } fail:^(NSError *error) {
                    
                    ZYLog(@"失败 == %@",error);
                    ZYLog(@"失败code = %ld",(long)error.code);
                    _accessToken = nil;
                    [SVProgressHUD showErrorWithStatus:@"token获取失败"];
                }];
    return _accessToken;
}
#pragma mark - 上传图片
- (void)uploadImag:(NSString *)token groupid:(NSString *)groupID img:(UIImage *)imag{
    [SVProgressHUD showWithStatus:@"正在上传"];
//    NSMutableDictionary * params = [NSMutableDictionary dictionary];
//    params[@"access_token"] = token;
//    params[@"uid"] = @"2";
//    params[@"user_info"] = @"FirstUser";
//    params[@"group_id"] = groupID;
//    NSData * imageData = UIImageJPEGRepresentation(imag, 0.5);
//    params[@"image"]= [NSString stringWithFormat:@"%@",[imageData base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)]];
//    params[@"action_type"] = @"";
//    [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/faceset/user/add" refreshCache:YES params:params success:^(id response) {
//        ZYLog(@"上传图片成功 == %@",response);
//        if (response[@"error_code"] == nil) {
//            [SVProgressHUD showSuccessWithStatus:@"上传成功"];
//            self.similarLabel.text = @"上传成功10S之后再进行其他操作哦";
//        }else{
//            [SVProgressHUD showErrorWithStatus:@"上传失败"];
//        self.similarLabel.text = [NSString stringWithFormat:@"错误码%@ -- msg:%@",response[@"error_code"],response[@"error_msg"]];
//        
//        }
//    } fail:^(NSError *error) {
//        ZYLog(@"err == %@",error);
//        [SVProgressHUD showErrorWithStatus:@"上传失败"];
//    }];
    
    NSDictionary * studentId = @{
                                 @"Id":@1374
                                 };
    NSData * imageData = UIImageJPEGRepresentation(imag, 0.3);
    NSString * pathImg = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    //NSString * pathImg= [NSString stringWithFormat:@"%@",[imageData base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)]];
    ZYLog(@"imageLenth == %lu",(unsigned long)imageData.length/1000);
    ZYLog(@"imageStrLentch == %lu",pathImg.length);
    NSDictionary * parameter = @{
                                 @"Id":@4,
                                 @"Student":studentId,
                                 @"PicturePath":pathImg,
                                 @"Remark":@""
                                 };
    [HYBNetworking postWithUrl:@"http://192.168.17.117:7010/StudentFaceInfoWcfService.svc/UploadFaceImage" refreshCache:YES params:parameter success:^(id response) {
        ZYLog(@"上传成功== %@",response);
    } fail:^(NSError *error) {
        ZYLog(@"上传失败 == %@",error);
    }];
    
}
#pragma mark - 比较
- (void)compareImage:(NSString *)token GroupID:(NSString *)groupid img:(UIImage *)imag{
    [SVProgressHUD showWithStatus:@"正在对比"];
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    parameter[@"access_token"] = token;
    parameter[@"group_id"] = groupid;
    NSData * imageData = UIImageJPEGRepresentation(imag, 0.5);
    parameter[@"image"]= [NSString stringWithFormat:@"%@",[imageData base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)]];
    [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/identify" refreshCache:YES params:parameter success:^(id response) {
        ZYLog(@"对比成功 == %@",response);
        if (response[@"error_code"] == nil) {
            NSArray * result = [response objectForKey:@"result"];
            NSString * similarFloat = [result[0] objectForKey:@"scores"][0];
            self.similarLabel.text = [NSString stringWithFormat:@"相似度%@",similarFloat];
            [SVProgressHUD dismiss];
        }else{
            self.similarLabel.text = [NSString stringWithFormat:@"错误码%@ -- msg:%@",response[@"error_code"],response[@"error_msg"]];
            [SVProgressHUD showErrorWithStatus:@"对比出错"];
        
        }
    } fail:^(NSError *error) {
        ZYLog(@"对比失败 == %@",error);
        [SVProgressHUD showErrorWithStatus:@"对比出错"];
    }];


}
#pragma mark - 查询
- (void)checkImage:(NSString *)token{
    [SVProgressHUD showWithStatus:@"正在查询"];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"access_token"] = token;
    params[@"uid"] = @"2";
    [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/faceset/user/get" refreshCache:YES params:params success:^(id response) {
        ZYLog(@"用户查询成功 == %@",response);
        if (response[@"error_code"] == nil) {
            self.similarLabel.text = [NSString stringWithFormat:@"总共【%@】条数据",[response objectForKey:@"result_num"]];
            [SVProgressHUD dismiss];
        }else{
            self.similarLabel.text = [NSString stringWithFormat:@"错误码%@ -- msg:%@",response[@"error_code"],response[@"error_msg"]];
            [SVProgressHUD showErrorWithStatus:@"查询出错"];
            
        }

    } fail:^(NSError *error) {
        ZYLog(@"查询失败 == %@",error);
    }];


}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _accessToken = [self getAccessToken];
}
@end
