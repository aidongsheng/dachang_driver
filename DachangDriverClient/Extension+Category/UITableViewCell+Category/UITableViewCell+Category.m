//
//  UITableViewCell+Category.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/6.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UITableViewCell+Category.h"

@implementation UITableViewCell (Category)

+ (void)registerToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}
+ (instancetype)baseTableViewCellWithTableView:(UITableView *)tableView
{
    NSString * identifier = stringFromClass(self);
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:identifier];
    }
    return cell;
}
@end
