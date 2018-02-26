//
//  DCTotalOrderViewController.m
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/25.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "DCTotalOrderViewController.h"

@interface DCTotalOrderViewController ()

@end

@implementation DCTotalOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QMUIMarqueeLabel * label = [[QMUIMarqueeLabel alloc]init];
    [label qmui_enumrateInstanceMethodsUsingBlock:^(SEL selector) {
        debug_NSLog(@"%@",NSStringFromSelector(selector));
    }];
}


@end
