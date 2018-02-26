//
//  UILabel+UnderlinePattern.m
//  51carlife
//
//  Created by lijun mou on 2017/11/28.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UILabel+UnderlinePattern.h"

@implementation UILabel (UnderlinePattern)

- (void)addUnderline
{
    if (self.text.length) {
        NSUInteger length = [self.text length];
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.text];
        [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
        [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, length)];
        [self setAttributedText:attri];
    }else{
        [QMUITips showError:@"当前标签🏷️没有文字" inView:[self currentController].view];
    }
}

@end
