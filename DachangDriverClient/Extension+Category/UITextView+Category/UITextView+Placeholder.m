//
//  UITextView+Placeholder.m
//  51carlife
//
//  Created by lijun mou on 2018/1/22.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

@interface UITextView()<UITextViewDelegate>
@property (nonatomic,strong) UILabel * placeholder_label;
@end

@implementation UITextView (Placeholder)
static char * placeholder_key = "placeholder_key";
static char * placeholder_label_key = "placeholder_label_key";

#pragma mark ========== 占位符Getter && Setter ============

- (instancetype)cl_init
{
    if (self == [super init]) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    self.placeholder_label = [[UILabel alloc]init];
    self.placeholder_label.font = [UIFont PingFangSCLightFontSize:LabelFontSizeMedium];
    self.placeholder_label.textColor = GrayColor;
    self.placeholder_label.backgroundColor = [UIColor qmui_randomColor];
    [self addSubview:self.placeholder_label];
    [self.placeholder_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
}
- (void)setPlaceholder:(NSString *)placeholder
{
    objc_setAssociatedObject(self, placeholder_key, self.placeholder, OBJC_ASSOCIATION_COPY);
    self.placeholder_label.text = placeholder;
}
- (NSString *)placeholder
{
    return objc_getAssociatedObject(self, placeholder_key);
}
#pragma mark ========== 占位符Getter && Setter ============
- (void)setPlaceholder_label:(UILabel *)placeholder_label
{
    objc_setAssociatedObject(self, placeholder_label_key, self.placeholder_label, OBJC_ASSOCIATION_RETAIN);
}
- (UILabel *)placeholder_label
{
    return objc_getAssociatedObject(self, placeholder_label_key);
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length) {
        self.placeholder_label.hidden = YES;
    }else{
        self.placeholder_label.hidden = NO;
    }
}
@end
