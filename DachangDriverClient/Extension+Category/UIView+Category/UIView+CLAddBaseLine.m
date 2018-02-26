//
//  UIView+CLAddBaseLine.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UIView+CLAddBaseLine.h"

@implementation UIView (CLAddBaseLine)

- (void)addBaseline:(CGFloat)lineWidth color:(UIColor *)lineColor direction:(BaseLineDirection)direction
{
    UIView * baseLine = [[UIView alloc]init];
    baseLine.backgroundColor = lineColor;
    
    
    if (direction == BaseLineDirectionTop) {
        baseLine.frame = CGRectMake(0,0, self.frame.size.width, lineWidth);
    }else if (direction == BaseLineDirectionLeft){
        baseLine.frame = CGRectMake(0, self.frame.size.height, lineWidth, self.frame.size.height);
    }else if (direction == BaseLineDirectionBottom){
        baseLine.frame = CGRectMake(0, self.frame.size.height - lineWidth, self.frame.size.width, lineWidth);
    }else if (direction == BaseLineDirectionRight){
        baseLine.frame = CGRectMake(self.frame.size.width - lineWidth, 0, lineWidth, self.frame.size.height);
    }
    [self addSubview:baseLine];
}


@end
