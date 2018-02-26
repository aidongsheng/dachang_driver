//
//  CustomNavBarHeaderView.h
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/16.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomNavBarHeaderViewDelegate<NSObject>
- (void)didSelectIndex:(NSInteger)index;
@end

@interface CustomNavBarHeaderView : UIView
@property (nonatomic,weak) id<CustomNavBarHeaderViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<NSString *> *)items;
- (void)didSelectItem:(UIButton *)sendor;
- (void)setupNavItems:(NSArray<NSString *> *)items;
@end
