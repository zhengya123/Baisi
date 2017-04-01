//
//  MY_MapVC.m
//  Baisibudejie
//
//  Created by dqong on 2016/11/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "MY_MapVC.h"

@interface MY_MapVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton * dateBtn;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UIDatePicker * datePicker;
@property (nonatomic, strong) UIToolbar * dateToolBar;
@end

@implementation MY_MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"百度地图";
    [self.view addSubview:self.dateBtn];
    self.textField.frame = CGRectMake(10, 150, SCREEN_W - 20, 40);
    [self.view addSubview:self.textField];
    self.textField.inputView = self.datePicker;
    self.textField.inputAccessoryView = self.dateToolBar;
}
-(void)dateBtnClick:(UIButton *)btn{



}
-(void)toolClick{
    [self.textField resignFirstResponder];


}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSDate * date = self.datePicker.date;
    NSDateFormatter * formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
    self.textField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];

}
#pragma mark - lan
-(UIButton *)dateBtn{
    if (_dateBtn == nil) {
        _dateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _dateBtn.frame = CGRectMake(10, 100, SCREEN_W - 20, 40);
        [_dateBtn setBackgroundColor:[UIColor yellowColor]];
        [_dateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_dateBtn addTarget:self action:@selector(dateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dateBtn;
}
-(UITextField *)textField{
    if (_textField == nil) {
        _textField = [UITextField new];
        _textField.delegate = self;
        _textField.placeholder = @"请选择时间";
    }
    return _textField;
}
-(UIDatePicker *)datePicker{
    if (_datePicker == nil) {
        _datePicker = [UIDatePicker new];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
         [_datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:(-24 * 3 + 8) * 60 * 60]];
        [_datePicker setMaximumDate:[NSDate dateWithTimeIntervalSinceNow:8 * 60 * 60]];
       
    }
    return _datePicker;
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
@end
