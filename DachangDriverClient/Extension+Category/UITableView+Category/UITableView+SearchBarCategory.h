//
//  UITableView+SearchBarCategory.h
//  51carlife
//
//  Created by lijun mou on 2018/1/5.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchBarTableViewDelegate<NSObject,UITableViewDataSource,UITableViewDelegate>

@end

@interface UITableView (SearchBarCategory)
@property (nonatomic,weak) id<SearchBarTableViewDelegate>searchDelegate;


- (instancetype)cl_initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
@end
