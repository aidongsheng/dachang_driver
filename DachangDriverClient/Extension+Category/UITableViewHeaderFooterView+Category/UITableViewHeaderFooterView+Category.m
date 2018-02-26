//
//  UITableViewHeaderFooterView+Category.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/6.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UITableViewHeaderFooterView+Category.h"

@implementation UITableViewHeaderFooterView (Category)
+ (void)registerToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:[self class]];
}
@end
