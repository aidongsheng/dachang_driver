//
//  CarouselCollectionViewCell.m
//  xinxiangjia
//
//  Created by aidongsheng on 2017/12/6.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CarouselCollectionViewCell.h"

@interface CarouselCollectionViewCell()
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) QMUILabel * titleLabel;
@end
@implementation CarouselCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _imageView = [[UIImageView alloc]init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _titleLabel = [[QMUILabel alloc]qmui_initWithFont:[UIFont PingFangSCSemiboldFontSize:LabelFontSizeMedium]
                                            textColor:WhiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_titleLabel];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.height.equalTo(@30);
        make.width.equalTo(self.contentView.mas_width);
    }];
}

- (void)setupCell:(CLIndexPageAidItemModel *)model
{
    
    NSString * imgUrl = [model valueForKey:@"picurl"];
    [_imageView setImageWithURL:url(imgUrl) placeholderImage:image(@"default")];
    _titleLabel.text = [model valueForKey:@"title"];
    
}
@end
