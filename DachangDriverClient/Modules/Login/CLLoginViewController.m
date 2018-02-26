//
//  CLLoginViewController.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CLLoginViewController.h"
#import "CLLoginView.h"

@interface CLLoginViewController ()
@property (nonatomic,strong) CLLoginView * loginView;
@end

@implementation CLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews
{
    [super setupSubViews];
    _loginView = [[CLLoginView alloc]init];
    [self.view addSubview:_loginView];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    _loginView.frame = CGRectMake(0, 0, Width, Height);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}
@end
