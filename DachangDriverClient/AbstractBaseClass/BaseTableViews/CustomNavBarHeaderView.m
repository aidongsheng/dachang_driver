//
//  CustomNavBarHeaderView.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/16.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CustomNavBarHeaderView.h"

@interface CustomNavBarHeaderView()

@property (nonatomic,strong) NSMutableArray * itemsArray;
@property (nonatomic) UIView * indicatorLine;
@end

@implementation CustomNavBarHeaderView


- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<NSString *> *)items
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubViews];
        [self configureActions];
        [self setupNavItems:items];
    }
    return self;
}

- (void)setupSubViews
{
    [super setupSubViews];
    
}

- (void)configureActions
{
    [super configureActions];
    
}

- (void)setupNavItems:(NSArray<NSString *> *)items
{
    debug_NSLog(@"初始化导航栏条目");
    if (items.count) {
        for (int index = 0; index < items.count; index++) {
            
            UIButton * button = [[UIButton alloc]init];
            button.tag = index;
            [button setTitle:items[index] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.frame = CGRectMake(_ScreenWidth/items.count*index, 0, _ScreenWidth/items.count, self.frame.size.height);
            [self addSubview:button];
            [button addTarget:self action:@selector(didSelectItem:) forControlEvents:UIControlEventTouchUpInside];
            [self.itemsArray addObject:button];
            [button setTitleColor:BlackColor forState:UIControlStateNormal];
        }
    }else{
        [self showInfo:@"没有发现任何导航条目"];
    }
}

- (void)didSelectItem:(UIButton *)sendor
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectIndex:)]) {
        for (UIButton * button in self.itemsArray) {
            [button setTitleColor:BlackColor forState:UIControlStateNormal];
        }
        [sendor setTitleColor:naviBar_tint_color forState:UIControlStateNormal];
        [self.delegate didSelectIndex:sendor.tag];
    }
}

- (NSMutableArray *)itemsArray
{
    if (_itemsArray == nil) {
        _itemsArray = [[NSMutableArray alloc]init];
    }
    return _itemsArray;
}

@end
