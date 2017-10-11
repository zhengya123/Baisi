//
//  ZY_Method.h
//  Baisibudejie
//
//  Created by dqong on 2016/10/25.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZY_Method : NSObject

/**
 * 获取字符串长度
 */
+ (CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width;
/**
 * 获取字符串宽度
 */
+ (CGFloat)stringWithSize:(NSString*)string fontOfSize:(CGFloat)font;
/**
 *  颜色转图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  获取手机型号
 */
+(NSString *)iphoneType;
/**
 *  是不是空字段
 */
+(id)isEmpty:(NSString *)str;
/**
 *  获取当前时间
 */
+(NSString*)getCurrentTimes;

+ (void)getDateInWeekWithDate:(NSString *)nowDate OutBegenTime:(NSString **)bTime OutendTime:(NSString **)eTime;
+ (NSString *)getBeforeDate:(NSString *)date days:(NSInteger)dayss;
+ (NSString *)getAfterDate:(NSString *)date days:(NSInteger)dayss;
@end
