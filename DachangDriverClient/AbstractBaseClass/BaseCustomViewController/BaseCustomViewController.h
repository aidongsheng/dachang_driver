//
//  BaseCustomViewController.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCustomViewController : UIViewController


/**
 *  You can only use this method when the current controller is an UINavigationController's rootViewController.
 */
- (void)useInteractivePopGestureRecognizer;

/**
 *  You can use this property when this controller is pushed by an UINavigationController.
 */
@property (nonatomic)  BOOL  enableInteractivePopGestureRecognizer;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop.
 *
 *  @param animated Animated or not.
 */
- (void)popViewControllerAnimated:(BOOL)animated;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
 *
 *  @param animated Animated or not.
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated;

- (void)setupSubViews;

- (void)setupDataSource;

- (void)configCell:(id)cell forRowAtIndexPath:(NSIndexPath *)indexPath;


/**
 配置tableview的头部视图或者尾部视图

 @param headerFooter 头部视图或者尾部视图
 @param section 视图所处的section信息
 */
- (void)configHeaderFooterView:(UIView *)headerFooter viewForHeaderInSection:(NSInteger)section;

/**
 配置导航栏左右按钮
 */
- (void)setupNavgationItems;

/**
 销毁不用的对象
 */
- (void)destroy;
- (void)showText:(NSString *)text;
- (void)showInfo:(NSString *)info;
- (void)showError:(NSString *)error;

@end
