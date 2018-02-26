//
//  UIImageView+TintColor.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/30.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UIImageView+TintColor.h"

@implementation UIImageView (TintColor)

- (instancetype)initWithImage:(UIImage *)image renderColor:(UIColor *)color
{
    if (self = [super init]) {
        self.image = image;
        self.contentMode = UIViewContentModeScaleAspectFit;
        [self rendorImageWithColor:color];
    }
    return self;
}

- (void)rendorImageWithColor:(UIColor *)renderColor
{
    self.tintColor = renderColor;
    self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
@end
