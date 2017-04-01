//
//  HCGDatePickerAppearance.h
//  HcgDatePicker-master
//
//  Created by ZRS on 14/12/2016.
//  Copyright © 2016 ZRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCGDatePicker.h"


@interface HCGDatePickerAppearance : UIView

- (instancetype)initWithDatePickerMode:(DatePickerMode)dataPickerMode completeBlock:(void (^)(NSDate *date))completeBlock;
- (void)show;

@end
