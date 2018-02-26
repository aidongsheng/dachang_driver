//
//  UITableViewCell+Category.h
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/6.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Category)
/**
 向tableView注册本类
 
 @param tableView 注册的 tableView 实例
 */
+ (void)registerToTableView:(UITableView *)tableView;

+ (instancetype)baseTableViewCellWithTableView:(UITableView *)tableView;
@end
