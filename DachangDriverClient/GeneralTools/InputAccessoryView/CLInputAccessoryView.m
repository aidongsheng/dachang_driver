//
//  CLInputAccessoryView.m
//  51carlife
//
//  Created by lijun mou on 2018/1/22.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CLInputAccessoryView.h"
@interface CLInputAccessoryView()<UITextViewDelegate>

@property (nonatomic,strong) QMUIButton * submitBtn;
@property (nonatomic,strong) UITextView * textView;
@end
@implementation CLInputAccessoryView

- (instancetype)init
{
    if (self = [super init]) {
        [self setupSubViews];
        [self configureActions];
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _textView = [[UITextView alloc]cl_init];
    [self addSubview:_textView];
    _submitBtn = [[QMUIButton alloc]init];
    [self addSubview:_submitBtn];
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0).offset(-UIElementSpace);
        make.width.equalTo(@50);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height).multipliedBy(0.8);
    }];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(UIElementSpace);
        make.right.equalTo(self.submitBtn.mas_left).offset(-UIElementSpace);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height).multipliedBy(0.8);
    }];
    [_submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:naviBar_tint_color forState:UIControlStateNormal];
    [_submitBtn setTitleColor:GrayColor forState:UIControlStateDisabled];
    _textView.textColor = BlackColor;
    _textView.placeholder = @"请输入...";
    [_textView addCornerRadiusAnimation:5];
    _textView.backgroundColor = RGB(250, 250, 250, 1);
    _textView.tintColor = naviBar_tint_color;
    self.layer.borderColor = GrayColor.CGColor;
    self.layer.borderWidth = 0.4;
    self.backgroundColor = WhiteColor;
    _textView.delegate = self;
    _submitBtn.enabled = NO;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_textView addCornerRadiusAnimation];
}

- (void)configureActions
{
    [super configureActions];
    [_submitBtn blockEvent:^(QMUIButton *button) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(submitText:)]) {
            [self.delegate submitText:_textView.text];
        }
    }];
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length) {
        _submitBtn.enabled = YES;
    }else{
        _submitBtn.enabled = NO;
    }
}
@end
