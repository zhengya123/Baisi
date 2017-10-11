//
//  EditVideoBackTimeVC.m
//  foodsecurityschool
//
//  Created by dqong on 2017/3/31.
//  Copyright © 2017年 dqong. All rights reserved.
//

#import "EditVideoBackTimeVC.h"
#import "API.h"
#import "commonModel.h"
#import "SVProgressHUD.h"
#import "ZY_BaseView.h"
@interface EditVideoBackTimeVC ()<UIAlertViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) UIButton * SubmitBtn;
@property (nonatomic, strong) UIButton * ClassName;
@property (nonatomic, strong) UILabel  * VideoNameLabel;
@property (nonatomic, strong) UILabel  * beginLabel;
@property (nonatomic, strong) UILabel  * endLabel;
@property (nonatomic, strong) UILabel  * lasterLabel;
@property (nonatomic, strong) UITextField  * VideoNameText;//课题名称
@property (nonatomic, strong) UITextField  * beginTextField;//开始时间
@property (nonatomic, strong) UITextField  * endTextField;//结束时间
@property (nonatomic, strong) UITextField  * lastTextField;//视频有效期截止时间
@property (nonatomic, strong) UIToolbar    * dateToolBar;
@property (nonatomic, strong) UIDatePicker * datePicker;
@property (nonatomic, strong) UIDatePicker * lastDatePicker;//视频截止的textField需要的时间
@property (nonatomic, strong) UILabel      * contueLabel;//视频持续时间


@end

@implementation EditVideoBackTimeVC
{

    NSTimeInterval compareDate;//比较开始和结束时间

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BG_COLOR;
    self.navigationItem.title = @"回放时间编辑";
    [self createUI];
    [SVProgressHUD setMinimumDismissTimeInterval:0.5f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:15]];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:80/255.0 green:133/255.0 blue:223/255.0 alpha:1.0]];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:0.8]];
    
}
-(void)createUI{

    UIBarButtonItem * barButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    /**改位置改这里就可以了 -20**/
    barButton.width = -10;
    self.navigationItem.rightBarButtonItems = @[barButton,[[UIBarButtonItem alloc]initWithCustomView:self.SubmitBtn]];
    
    self.ClassName.frame = CGRectMake(10, 10, SCREEN_W - 20, 40);
    [self.view addSubview:self.ClassName];
    
    self.VideoNameLabel.frame = CGRectMake(10, CGRectGetMaxY(self.ClassName.frame) + 10, 90, 40);
    self.beginLabel.frame = CGRectMake(10, CGRectGetMaxY(self.VideoNameLabel.frame) + 10, 90, 40);
    self.endLabel.frame = CGRectMake(10, CGRectGetMaxY(self.beginLabel.frame) + 10, 90, 40);
    self.lasterLabel.frame = CGRectMake(10, CGRectGetMaxY(self.endLabel.frame) + 10, [ZY_BaseView stringWithSize:@"视频有效截止时间:" fontOfSize:17].size.width, 40);
    [self.view addSubview:self.VideoNameLabel];
    [self.view addSubview:self.beginLabel];
    [self.view addSubview:self.endLabel];
    [self.view addSubview:self.lasterLabel];
    
    self.VideoNameText.frame = CGRectMake(CGRectGetMaxX(self.VideoNameLabel.frame), CGRectGetMaxY(self.ClassName.frame) + 10, SCREEN_W - CGRectGetMaxX(self.VideoNameLabel.frame) - 10, 40);
    self.beginTextField.frame = CGRectMake(CGRectGetMaxX(self.beginLabel.frame), CGRectGetMaxY(self.VideoNameText.frame) + 10, SCREEN_W - CGRectGetMaxX(self.beginLabel.frame) - 10, 40);
    self.endTextField.frame = CGRectMake(CGRectGetMaxX(self.endLabel.frame), CGRectGetMaxY(self.beginTextField.frame) + 10, SCREEN_W - CGRectGetMaxX(self.endLabel.frame) - 10, 40);
    self.lastTextField.frame = CGRectMake(CGRectGetMaxX(self.lasterLabel.frame), CGRectGetMaxY(self.endTextField.frame) + 10, SCREEN_W - CGRectGetMaxX(self.lasterLabel.frame) - 10, 40);
    self.beginTextField.inputView = self.datePicker;
    self.endTextField.inputView   = self.datePicker;
    self.lastTextField.inputView  = self.lastDatePicker;
    self.beginTextField.inputAccessoryView = self.dateToolBar;
    self.endTextField.inputAccessoryView   = self.dateToolBar;
    self.lastTextField.inputAccessoryView  = self.dateToolBar;
    
    [self.view addSubview:self.VideoNameText];
    [self.view addSubview:self.beginTextField];
    [self.view addSubview:self.endTextField];
    [self.view addSubview:self.lastTextField];
    
    self.contueLabel.frame = CGRectMake(10, CGRectGetMaxY(self.lastTextField.frame) + 10, SCREEN_W - 20, 40);
    [self.view addSubview:self.contueLabel];
    
    /**
     * 在这里判断是不是管理员，如果是，则可以选择班级
     * 如果不是管理员，看有没有绑定班级，如果有，则可以继续操作，如果没有，则退出
     */
    NSNumber * isadmin = [[NSUserDefaults standardUserDefaults]objectForKey:@"IsAdmin"];
    if ([isadmin isEqualToNumber:@1]) {
        ZYLog(@"去选择学校");
        self.ClassName.enabled = YES;
        [self.ClassName setTitle:@"点击选择班级" forState:UIControlStateNormal];
        
    }else{
    
        self.ClassName.enabled = NO;
        NSString * className = [[NSUserDefaults standardUserDefaults]objectForKey:@"KindergartenRoomName"];
        if ([className isEqualToString:@""]) {
            self.SubmitBtn.enabled = NO;
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"该账号不是管理员且没有绑定班级" message:nil delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            alert.tag = 3301;
            [alert show];
        }else{
            self.SubmitBtn.enabled = YES;
            [self.ClassName setTitle:className forState:UIControlStateNormal];
        
        }
    }

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 3301) {
        [self.navigationController popViewControllerAnimated:YES];
    }

}
#pragma mark - 提交按钮
-(void)submitBtnClick:(UIButton *)btn{
    btn.enabled = NO;
    if ([[self checkSunmitInfo] isEqualToString:@"检查通过"]) {
        [SVProgressHUD showWithStatus:@"正在提交"];
        ZYLog(@"开始时间%@ \n  截止时间%@",self.beginTextField.text,self.endTextField.text);
        [self performSelector:@selector(delay) withObject:nil afterDelay:2];
    }else{
        self.SubmitBtn.enabled = YES;
        UIAlertView * al = [[UIAlertView alloc]initWithTitle:[self checkSunmitInfo] message:nil delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [al show];
    }
    

}
-(void)delay{
    
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
    self.SubmitBtn.enabled = YES;

}
#pragma mark - 检查提交信息是否完整
-(NSString *)checkSunmitInfo{
    NSString * rebackInfo;
    NSString * videoname = [self.VideoNameText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * begintime = [self.beginTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString * endtime = [self.endTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    if (self.ClassName.titleLabel.text.length == 0) {
        
        rebackInfo = @"班级不能为空";
        
    }else if (videoname.length == 0){
   
        rebackInfo = @"课题名称不能为空";
    
    }else if (begintime.length == 0){
   
        rebackInfo = @"请选择开始时间";
    
    }else if (endtime.length == 0){
    
        rebackInfo = @"请选择结束时间";
        
    }else{
    
        
        if ([self isBig:self.beginTextField.text endtime:self.endTextField.text] == YES) {
            if ([self isEqualDay:self.beginTextField.text EndDay:self.endTextField.text] == YES) {
                rebackInfo = @"检查通过";
            }else{
                rebackInfo = @"开始时间和结束时间必须一致";
            }
            
        }else{
            rebackInfo = @"结束时间必须比开始时间晚";
        }
    }
    return rebackInfo;

}
#pragma mark - 将字符串转换为NSDate
- (NSDate *)compareTime:(NSString *)str
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat       = @"yyyy-MM-dd";
    NSString *beginTimeString      = [NSString stringWithFormat:@"%@",str];
    dateFormatter.dateFormat       = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter dateFromString:beginTimeString];
}
#pragma mark - 视频持续时间
-(NSString *)continueTime:(NSString *)beginTime endTime:(NSString *)endtime{
    NSString * rebackInfo;
    NSTimeInterval cintm = [[self compareTime:endtime] timeIntervalSinceDate:[self compareTime:beginTime]];
    if (cintm >= 3600)
    {
        int hour                  = (int)cintm / 3600;
        int minute                = ((int)cintm % 3600) / 60;
        int seconds               = (int)cintm % 60;
        rebackInfo = [NSString stringWithFormat:@"%02d:%02d:%02d",hour,minute,seconds];
    }else{
        int minute                = (int)cintm / 60;
        int seconds               = (int)cintm % 60;
        rebackInfo = [NSString stringWithFormat:@"%02d:%02d", minute, seconds];
    }
    return rebackInfo;

}
#pragma mark - 管理员选择班级按钮
-(void)chooseClassClick:(UIButton *)btn{
 
    

}
#pragma mark - toolBar按钮
-(void)toolClick{

    [self.beginTextField resignFirstResponder];
    [self.endTextField resignFirstResponder];
    [self.lastTextField resignFirstResponder];

}
#pragma mark - textFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSDate * date = nil;
    if (textField == self.lastTextField) {
        date = self.lastDatePicker.date;
    }else{
        date = self.datePicker.date;
    }
    NSDateFormatter * formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
    NSString * datatext = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    if (textField == self.beginTextField) {
       self.beginTextField.text = datatext;
    }else if (textField == self.endTextField){
       self.endTextField.text = datatext;
    }else{
        self.lastTextField.text = datatext;
    }
    
    if (self.beginTextField.text.length != 0 && self.endTextField.text.length != 0) {
        if ([self isBig:self.beginTextField.text endtime:self.endTextField.text] == YES) {
            if ([self isEqualDay:self.beginTextField.text EndDay:self.endTextField.text] == NO) {
                self.contueLabel.textColor = [UIColor redColor];
                self.contueLabel.text = @"开始时间和结束时间必须为同一天";
            }else{
                self.contueLabel.textColor = [UIColor blackColor];
                self.contueLabel.text = [NSString stringWithFormat:@"视频持续时间: %@",[self continueTime:self.beginTextField.text endTime:self.endTextField.text]];
            }
            
        }else{
            self.contueLabel.textColor = [UIColor redColor];
        self.contueLabel.text = @"结束时间必须比开始时间晚";
        }
    }
}
#pragma mark - 结束时间是否比开始时间晚
-(BOOL)isBig:(NSString *)bentime endtime:(NSString *)ends{
    NSDate * begintimes = [self compareTime:bentime];
    NSDate * endtimes   = [self compareTime:ends];
    compareDate = [endtimes timeIntervalSinceDate:begintimes];
    if (compareDate > 0) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - 判断是否为同一天
-(BOOL)isEqualDay:(NSString *)BenDay EndDay:(NSString *)endday{
    NSString * B_Str = [BenDay substringToIndex:10];
    NSString * E_Str = [endday substringToIndex:10];
    ZYLog(@"开始 == %@ -- 结束 == %@",B_Str,E_Str);
    if ([B_Str isEqualToString:E_Str]) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - lan
-(UIButton *)SubmitBtn{
    if (_SubmitBtn == nil) {
        _SubmitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _SubmitBtn.frame = CGRectMake(0, 0, 50, 50);
        [_SubmitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_SubmitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _SubmitBtn;
}
-(UIButton *)ClassName{
    if (_ClassName == nil) {
        _ClassName =[UIButton buttonWithType:UIButtonTypeCustom];
        [_ClassName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_ClassName addTarget:self action:@selector(chooseClassClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ClassName setBackgroundColor:[UIColor whiteColor]];
        _ClassName.layer.masksToBounds = YES;
        _ClassName.layer.cornerRadius  = 4;
        _ClassName.layer.borderWidth   = 1;
        _ClassName.layer.borderColor   = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    }
    return _ClassName;
}
-(UITextField *)VideoNameText{
    if (_VideoNameText == nil) {
        _VideoNameText = [UITextField new];
        _VideoNameText.placeholder = @"课题名称";
        _VideoNameText.textAlignment = NSTextAlignmentRight;
        _VideoNameText.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _VideoNameText;
}
-(UITextField *)beginTextField{
    if (_beginTextField == nil) {
        _beginTextField =[UITextField new];
        _beginTextField.delegate = self;
        _beginTextField.placeholder = @"回放开始时间";
        _beginTextField.textAlignment = NSTextAlignmentRight;
        _beginTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _beginTextField;
}
-(UITextField *)lastTextField{
    if (_lastTextField == nil) {
        _lastTextField = [UITextField new];
        _lastTextField.delegate = self;
        _lastTextField.placeholder = @"视频有效期截止时间";
        _lastTextField.textAlignment = NSTextAlignmentRight;
        _lastTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _lastTextField;
}
-(UITextField *)endTextField{
    if (_endTextField == nil) {
        _endTextField =[UITextField new];
        _endTextField.delegate = self;
        _endTextField.placeholder = @"回放结束时间";
        _endTextField.textAlignment = NSTextAlignmentRight;
        _endTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _endTextField;
}-(UIToolbar *)dateToolBar{
    if (_dateToolBar == nil) {
        _dateToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 40)];
        _dateToolBar.backgroundColor = [UIColor blackColor];
        UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem * item3 = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(toolClick)];
        _dateToolBar.items = @[item2,item3];
    }
    return _dateToolBar;
}
-(UIDatePicker *)datePicker{
    if (_datePicker == nil) {
        _datePicker = [UIDatePicker new];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        [_datePicker setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
        [_datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:(-24 * 3) * 60 * 60]];
        [_datePicker setMaximumDate:[NSDate date]];
        
    }
    return _datePicker;
}
-(UIDatePicker *)lastDatePicker{
    if (_lastDatePicker == nil) {
        _lastDatePicker = [UIDatePicker new];
        _lastDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
        [_lastDatePicker setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
        [_lastDatePicker setMinimumDate:[NSDate date]];
        [_lastDatePicker setMaximumDate:[NSDate dateWithTimeIntervalSinceNow:(24 * 3) * 60 * 60]];
    }
    return _lastDatePicker;
}
-(UILabel *)VideoNameLabel{
    if (_VideoNameLabel == nil) {
        _VideoNameLabel = [UILabel new];
        _VideoNameLabel.textColor = [UIColor blackColor];
        _VideoNameLabel.textAlignment = NSTextAlignmentLeft;
        _VideoNameLabel.font = [UIFont systemFontOfSize:17];
        _VideoNameLabel.text = @"课题名称:";
    }
    return _VideoNameLabel;
}
-(UILabel *)beginLabel{
    if (_beginLabel == nil) {
        _beginLabel =[UILabel new];
        _beginLabel.textColor = [UIColor blackColor];
        _beginLabel.textAlignment = NSTextAlignmentLeft;
        _beginLabel.font = [UIFont systemFontOfSize:17];
        _beginLabel.text = @"开始时间:";
    }
    return _beginLabel;
}
-(UILabel *)endLabel{
    if (_endLabel == nil) {
        _endLabel = [UILabel new];
        _endLabel.textColor = [UIColor blackColor];
        _endLabel.textAlignment = NSTextAlignmentLeft;
        _endLabel.font = [UIFont systemFontOfSize:17];
        _endLabel.text = @"结束时间:";
    }
    return _endLabel;
}
-(UILabel *)lasterLabel{
    if (_lasterLabel == nil) {
        _lasterLabel = [UILabel new];
        _lasterLabel.textColor = [UIColor blackColor];
        _lasterLabel.textAlignment = NSTextAlignmentLeft;
        _lasterLabel.font = [UIFont systemFontOfSize:17];
        _lasterLabel.text = @"视频有效截止时间:";
    }
    return _lasterLabel;
}

-(UILabel *)contueLabel{
    if (_contueLabel == nil) {
        _contueLabel = [UILabel new];
        _contueLabel.textColor = [UIColor blackColor];
        _contueLabel.textAlignment = NSTextAlignmentLeft;
        _contueLabel.font = [UIFont systemFontOfSize:17];
    }
    return _contueLabel;
}
@end
