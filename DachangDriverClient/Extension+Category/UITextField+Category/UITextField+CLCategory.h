//
//  UITextField+CLCategory.h
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CLCategory)
//  判断是否是格式正确的手机号码
- (BOOL)isValidPhoneNumber;
//  判断是否是格式正确的车牌号码
- (BOOL)isValidPlatesNumber;

- (void)addBorderWithWidth:(CGFloat)width borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)radius;
@end
