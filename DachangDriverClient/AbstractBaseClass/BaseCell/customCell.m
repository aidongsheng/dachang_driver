//
//  customCell.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/11.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "customCell.h"

@implementation customCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
        [self buildSubview];
    }
    return self;
}

- (void)setupCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)buildSubview
{
    
}

- (void)loadContent
{
    
}
+ (void)registerToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
