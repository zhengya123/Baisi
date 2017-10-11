//
//  HHjiujiuDetailViewController.m
//  Baisi
//
//  Created by dqong on 2017/4/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "HHjiujiuDetailViewController.h"

@interface HHjiujiuDetailViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel * countView;
@property (nonatomic, strong) UITextField  * beginTextField;//开始时间
@property (nonatomic, strong) UIToolbar    * dateToolBar;
@property (nonatomic, strong) UIDatePicker * datePicker;
@end

@implementation HHjiujiuDetailViewController
{

    NSTimer * counttime;
    int      WarmingTime;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.countView.frame = CGRectMake(10, 100, SCREEN_W - 20, 40);
    self.beginTextField.frame = CGRectMake(10, CGRectGetMaxY(self.countView.frame) + 210, SCREEN_W - 20, 40);
    [self.view addSubview:self.countView];
    [self.view addSubview:self.beginTextField];
    self.beginTextField.inputView = self.datePicker;
    self.beginTextField.inputAccessoryView = self.dateToolBar;
}
- (IBAction)countBtn:(UIButton *)sender {
    [counttime invalidate];
    counttime = nil;
    
    NSString * bentime = self.beginTextField.text;
    WarmingTime = 24 * 60 * 60 - [[self isBig:bentime endtime:[self getNoeDateWithStyle:@"yyyy-MM-dd HH:mm:ss"]] intValue];
    counttime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countWormings) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:counttime forMode:NSRunLoopCommonModes];
    
}
-(void)countWormings{
    WarmingTime--;
    ZYLog(@"2分钟倒计时 == %d",WarmingTime);
    self.countView.text = [NSString stringWithFormat:@"%@",[self dealTheTime:[NSString stringWithFormat:@"%d",WarmingTime]]];
    if (WarmingTime <= 0) {
        [counttime invalidate];
        counttime = nil;
        self.countView.text = [NSString stringWithFormat:@"0"];
    }
    
}

//时间处理
-(NSString *)dealTheTime:(NSString *)duration
{
    
    
    NSInteger second = [duration intValue];
    NSInteger hour = second/3600;
    NSInteger min = (second-hour*3600)/60;
    NSInteger secondfinal = second-hour*3600-min*60;
    NSString * retureStr;
    NSString * minstr;
    NSString * secondstr;
    if (min < 10) {
        minstr = [NSString stringWithFormat:@"0%ld",(long)min];
    }else{
        minstr = [NSString stringWithFormat:@"%ld",(long)min];
    }
    if (secondfinal < 10) {
        secondstr = [NSString stringWithFormat:@"0%ld",(long)secondfinal];
    }else{
        secondstr = [NSString stringWithFormat:@"%ld",(long)secondfinal];
    }

    
    if (hour < 1) {
        if ( min < 1){
            retureStr = [NSString stringWithFormat:@"%@",secondstr];
        }else{
            retureStr = [NSString stringWithFormat:@"%@:%@",minstr,secondstr];
        }
        
    }else {
           retureStr = [NSString stringWithFormat:@"%ld:%@:%@",(long)hour,minstr,secondstr];
    }
    return retureStr;
}
-(void)toolClick{

   [self.beginTextField resignFirstResponder];
}
#pragma mark - textFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
 
    NSDate * date = nil;
    date = self.datePicker.date;
    NSDateFormatter * formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
    NSString * datatext = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    self.beginTextField.text = datatext;
    
}
#pragma mark - lan
-(UILabel *)countView{
    if (_countView == nil) {
        _countView = [UILabel new];
        _countView.textAlignment = NSTextAlignmentCenter;
        _countView.textColor = [UIColor blackColor];
        _countView.layer.masksToBounds = YES;
        _countView.layer.cornerRadius  = 8;
        _countView.layer.borderWidth   = 1;
        _countView.layer.borderColor   = [[UIColor redColor] CGColor];
        _countView.font = [UIFont systemFontOfSize:20];
    }
    return _countView;
}
-(UITextField *)beginTextField{
    if (_beginTextField == nil) {
        _beginTextField =[UITextField new];
        _beginTextField.delegate = self;
        _beginTextField.placeholder = @"订单时间";
        _beginTextField.textAlignment = NSTextAlignmentCenter;
        _beginTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _beginTextField;
}
-(UIToolbar *)dateToolBar{
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


#pragma mark - 获取当前时间
-(NSString *)getNoeDateWithStyle:(NSString *)style{
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:style];
    NSDate * datenow = [NSDate date];
    return [formatter stringFromDate:datenow];
}
#pragma mark - 结束时间是否比开始时间晚
-(NSString *)isBig:(NSString *)bentime endtime:(NSString *)ends{
    
    NSDate * begintimes = [self compareTime:bentime];
    NSDate * endtimes   = [self compareTime:ends];
    NSTimeInterval  compareDate;
    compareDate = [endtimes timeIntervalSinceDate:begintimes];
    ZYLog(@"%@",[NSString stringWithFormat:@"%f",compareDate]);
    return [NSString stringWithFormat:@"%f",compareDate];
   
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

@end
