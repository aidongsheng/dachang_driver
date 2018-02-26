//
//  CLMarkView.h
//  51carlife
//
//  Created by lijun mou on 2018/1/20.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLMarkView : UIView
@property (nonatomic,assign) NSInteger order_id;
@property (nonatomic,assign) NSInteger score;
@property (nonatomic,strong) NSMutableArray * assess_tags;
@property (nonatomic,copy) NSString * assess_content;

- (instancetype)initWithTitle:(NSString *)title;
@end
