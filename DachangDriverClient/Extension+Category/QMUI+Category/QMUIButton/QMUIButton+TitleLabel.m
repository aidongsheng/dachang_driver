//
//  QMUIButton+TitleLabel.m
//  51carlife
//
//  Created by lijun mou on 2017/11/28.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "QMUIButton+TitleLabel.h"

@implementation QMUIButton (TitleLabel)

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self setTitleColor:BlackColor forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeMedium];
}

@end
