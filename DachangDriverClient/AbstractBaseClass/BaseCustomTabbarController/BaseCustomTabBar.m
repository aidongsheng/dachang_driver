//
//  BaseCustomTabBar.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/13.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BaseCustomTabBar.h"

@implementation BaseCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *workbenchBtn = [[UIButton alloc] init];
        [workbenchBtn setImage:[UIImage imageNamed:@"tabbar_workbench_select"] forState:UIControlStateNormal];
        CGRect temp = workbenchBtn.frame;
        temp.size=workbenchBtn.currentImage.size;
        workbenchBtn.frame=temp;
        [workbenchBtn addTarget:self action:@selector(workbenchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:workbenchBtn];
        self.workbenchButton = workbenchBtn;
    }
    return self;
}

- (void)workbenchButtonClicked
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabbarDidClickWorkbenchButton:)]) {
        [self.tabBarDelegate tabbarDidClickWorkbenchButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
        // 1.设置加号按钮的位置
    CGPoint temp = self.workbenchButton.center;
    temp.x=self.frame.size.width/2;
    temp.y=self.frame.size.height/2;
    self.workbenchButton.center=temp;
    
        // 2.设置其它UITabBarButton的位置和尺寸
    CGFloat tabbarButtonW = self.frame.size.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.items) {
        NSLog(@"设置其它UITabBarButton的位置和尺寸");
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
                // 设置宽度
            CGRect temp1=child.frame;
            temp1.size.width=tabbarButtonW;
            temp1.origin.x=tabbarButtonIndex * tabbarButtonW;
            child.frame=temp1;
                // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
