//
//  CAShapeLayer+Category.m
//  51carlife
//
//  Created by lijun mou on 2018/1/2.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CAShapeLayer+Category.h"

@implementation CAShapeLayer (Category)


- (instancetype)markLayerWithScore:(NSInteger)score
{
    if (self == [super init]) {
        NSString * string;
        if (score == 0) {
            string = @"☆☆☆☆☆";
        }else if (score == 1){
            string = @"★☆☆☆☆";
        }else if (score == 2){
            string = @"★★☆☆☆";
        }else if (score == 3){
            string = @"★★★☆☆";
        }else if (score == 4){
            string = @"★★★★☆";
        }else if (score == 5){
            string = @"★★★★★";
        }else{
            string = @"★★★☆☆";
        }
        UIBezierPath *path = [UIBezierPath bezierPathWithText:string font:[UIFont PingFangSCThinFontSize:20]];
        self.path = path.CGPath;
        UIColor *fillColor = RGB(223, 187, 72, 1);
        self.fillColor = fillColor.CGColor;
        UIColor *strokeColor = [UIColor lightTextColor];
        self.strokeColor = strokeColor.CGColor;
        self.lineWidth = 1;
        [self startAnimation];
    }
    return self;
}

- (void)startAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 0.6;
    animation.repeatCount = 1.0f;
    animation.fromValue = @0.0f;
    animation.toValue = @1.0f;
    [self addAnimation:animation forKey:@"mark_animation"];
}


@end
