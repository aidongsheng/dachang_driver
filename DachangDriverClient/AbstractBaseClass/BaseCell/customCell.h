//
//  customCell.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/11.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customCellDelegate<NSObject>

@optional

@end

@interface customCell : UITableViewCell

/**
 *  Setup cell, overwrite by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, overwrite by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, overwrite by subclass.
 */
- (void)loadContent;

/**
 向tableView注册本类

 @param tableView 注册的 tableView 实例
 */
+ (void)registerToTableView:(UITableView *)tableView;
@end
