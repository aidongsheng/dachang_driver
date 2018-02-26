//
//  CLMarkView.m
//  51carlife
//
//  Created by lijun mou on 2018/1/20.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CLMarkView.h"

@interface CLMarkView()<CLInputAccessoryViewDelegate>
@property (nonatomic,strong) QMUIButton * star1, * star2, * star3, * star4, *star5;
@property (nonatomic,strong) UILabel * askLabel;
@property (nonatomic,strong) QMUIFloatLayoutView * floatView;
@property (nonatomic,strong) UITextView * textView;
@property (nonatomic,strong) NSMutableArray * serviceItems;
@property (nonatomic,strong) CLInputAccessoryView * inputAccessoryView;

@end
@implementation CLMarkView

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        _askLabel.text = title;
        [self setupSubViews];
        [self configureActions];
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    CGFloat heightRatio = 0.1;
    _star1 = [[QMUIButton alloc]qmui_initWithImage:image(@"mark_star_gray_icon") title:@"极差"];
    _star2 = [[QMUIButton alloc]qmui_initWithImage:image(@"mark_star_gray_icon") title:@"较差"];
    _star3 = [[QMUIButton alloc]qmui_initWithImage:image(@"mark_star_gray_icon") title:@"一般"];
    _star4 = [[QMUIButton alloc]qmui_initWithImage:image(@"mark_star_gray_icon") title:@"不错"];
    _star5 = [[QMUIButton alloc]qmui_initWithImage:image(@"mark_star_gray_icon") title:@"很棒"];
    
    _star1.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    _star2.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    _star3.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    _star4.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    _star5.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    
    _star1.imagePosition = QMUIButtonImagePositionTop;
    _star2.imagePosition = QMUIButtonImagePositionTop;
    _star3.imagePosition = QMUIButtonImagePositionTop;
    _star4.imagePosition = QMUIButtonImagePositionTop;
    _star5.imagePosition = QMUIButtonImagePositionTop;
    
    [_star1 setTitleColor:GrayColor forState:UIControlStateNormal];
    [_star2 setTitleColor:GrayColor forState:UIControlStateNormal];
    [_star3 setTitleColor:GrayColor forState:UIControlStateNormal];
    [_star4 setTitleColor:GrayColor forState:UIControlStateNormal];
    [_star5 setTitleColor:GrayColor forState:UIControlStateNormal];
    
    _star1.spacingBetweenImageAndTitle = UIElementSpace;
    _star2.spacingBetweenImageAndTitle = UIElementSpace;
    _star3.spacingBetweenImageAndTitle = UIElementSpace;
    _star4.spacingBetweenImageAndTitle = UIElementSpace;
    _star5.spacingBetweenImageAndTitle = UIElementSpace;
    
    _star1.tag = 2;
    _star2.tag = 4;
    _star3.tag = 6;
    _star4.tag = 8;
    _star5.tag = 10;
    
    [self addSubview:_star1];
    [self addSubview:_star2];
    [self addSubview:_star3];
    [self addSubview:_star4];
    [self addSubview:_star5];
    
    _askLabel = [[QMUILabel alloc]qmui_initWithFont:[UIFont PingFangSCMediumFontSize:LabelFontSizeMedium]
                                        textColor:BlackColor];
    _askLabel.textAlignment = NSTextAlignmentCenter;
    _askLabel.textColor = BlackColor;
    [self addSubview:_askLabel];
    
    [_askLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.equalTo(self.mas_height).multipliedBy(2.5*heightRatio);
    }];
    [_star1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).multipliedBy(0.25);
        make.height.equalTo(self.mas_height).multipliedBy(2.5*heightRatio);
        make.width.equalTo(self.mas_width).multipliedBy(0.15);
        make.top.equalTo(_askLabel.mas_bottom);
    }];
    [_star2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_star1.mas_right);
        make.height.equalTo(self.mas_height).multipliedBy(2.5*heightRatio);
        make.width.equalTo(self.mas_width).multipliedBy(0.15);
        make.top.equalTo(_askLabel.mas_bottom);
    }];
    [_star3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_star2.mas_right);
        make.height.equalTo(self.mas_height).multipliedBy(2.5*heightRatio);
        make.width.equalTo(self.mas_width).multipliedBy(0.15);
        make.top.equalTo(_askLabel.mas_bottom);
    }];
    [_star4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_star3.mas_right);
        make.height.equalTo(self.mas_height).multipliedBy(2.5*heightRatio);
        make.width.equalTo(self.mas_width).multipliedBy(0.15);
        make.top.equalTo(_askLabel.mas_bottom);
    }];
    [_star5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_star4.mas_right);
        make.height.equalTo(self.mas_height).multipliedBy(2.5*heightRatio);
        make.width.equalTo(self.mas_width).multipliedBy(0.15);
        make.top.equalTo(_askLabel.mas_bottom);
    }];
    [_star1 addScaleToSmallAnimation:0.8 autoreverses:NO];
    [_star2 addScaleToSmallAnimation:0.8 autoreverses:NO];
    [_star3 addScaleToSmallAnimation:0.8 autoreverses:NO];
    [_star4 addScaleToSmallAnimation:0.8 autoreverses:NO];
    [_star5 addScaleToSmallAnimation:0.8 autoreverses:NO];
    
    _floatView = [[QMUIFloatLayoutView alloc]init];
    [self addSubview:_floatView];
    [_floatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.centerY.equalTo(self.mas_centerY).multipliedBy(1.5);
        make.height.equalTo(self.mas_height).multipliedBy(5*heightRatio);
    }];
    _floatView.itemMargins = UIEdgeInsetsMake(8, 10, 8, 10);
    _floatView.minimumItemSize = CGSizeMake(70, 30);
    _floatView.padding = UIEdgeInsetsMake(0, 30, 0, 30);
    for (int index = 0; index < self.serviceItems.count; index++) {
        QMUIButton * button = [[QMUIButton alloc]init];
        [_floatView addSubview:button];
        button.backgroundColor = GrayColor;
        button.layer.cornerRadius = UIElementSpace;
        button.clipsToBounds = YES;
        button.titleLabel.font = [UIFont PingFangSCThinFontSize:LabelFontSizeSmall];
        [button setTitle:self.serviceItems[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"b3b3b3"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"fffefe"] forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"e63030"]]
                          forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"ebebeb"]]
                          forState:UIControlStateNormal];
        [button addCornerRadiusAnimation:UIElementSpace];
        [button blockEvent:^(QMUIButton *button) {
            button.selected = !button.selected;
            if (button.selected) {
                [self.assess_tags addObject:button.titleLabel.text];
            }else{
                [self.assess_tags removeObject:button.titleLabel.text];
            }
        }];
    }
    
    _textView = [[UITextView alloc]cl_init];
    [self addSubview:_textView];
    _textView.layer.borderColor = BlackColor.CGColor;
    _textView.layer.borderWidth = 0.2;
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.equalTo(self.mas_height).multipliedBy(3*heightRatio);
    }];
    _textView.placeholder = @"请填写您想反馈的意见";
    self.inputAccessoryView.frame = CGRectMake(0, 0, Width, 50);
    _textView.inputAccessoryView = self.inputAccessoryView;
    _textView.hidden = YES;
    _askLabel.text = @"请评价一下救援您的师傅吧";
    _askLabel.textColor = BlackColor;
}

- (CLInputAccessoryView *)inputAccessoryView
{
    if (!_inputAccessoryView) {
        _inputAccessoryView = [[CLInputAccessoryView alloc]init];
        _inputAccessoryView.delegate = self;
    }
    return _inputAccessoryView;
}

- (NSMutableArray *)serviceItems
{
    if (!_serviceItems) {
        _serviceItems = [[NSMutableArray alloc]init];
        [_serviceItems addObject:@"推荐"];
        [_serviceItems addObject:@"服务态度好"];
        [_serviceItems addObject:@"按时到达"];
        [_serviceItems addObject:@"不错"];
        [_serviceItems addObject:@"准备很齐全"];
        [_serviceItems addObject:@"很有耐心"];
    }
    return _serviceItems;
}

- (void)configureActions
{
    [super configureActions];
    [_star1 blockEvent:^(QMUIButton *button) {
        [_star1 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star2 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        [_star3 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        [_star4 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        [_star5 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        _score = button.tag;
    }];
    [_star2 blockEvent:^(QMUIButton *button) {
        [_star1 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star2 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star3 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        [_star4 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        [_star5 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        _score = button.tag;
    }];
    [_star3 blockEvent:^(QMUIButton *button) {
        [_star1 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star2 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star3 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star4 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        [_star5 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        _score = button.tag;
    }];
    [_star4 blockEvent:^(QMUIButton *button) {
        [_star1 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star2 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star3 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star4 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star5 setImage:image(@"mark_star_gray_icon") forState:UIControlStateNormal];
        _score = button.tag;
    }];
    [_star5 blockEvent:^(QMUIButton *button) {
        [_star1 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star2 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star3 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star4 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        [_star5 setImage:image(@"mark_star_red_icon") forState:UIControlStateNormal];
        _score = button.tag;
    }];
}
- (NSMutableArray *)assess_tags
{
    if (!_assess_tags) {
        _assess_tags = [[NSMutableArray alloc]init];
    }
    return _assess_tags;
}

- (void)submitText:(NSString *)text
{
    _textView.text = text;
}

@end
