//
//  CLMapView.m
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CLMapView.h"

@interface CLMapView()

@property (nonatomic,strong) QMUIButton * locateButton;
@property (nonatomic,assign) LocateButtonPosition position;
@property (nonatomic,strong) QMUIButton * zoom_out_btn, * zoom_in_btn;
@end

@implementation CLMapView

- (instancetype)initWithLocateButtonPosition:(LocateButtonPosition)position
{
    if (self = [super init]) {
        _position = position;
        self.showsUserLocation = YES;
        self.userTrackingMode = BMKUserTrackingModeFollow;
        [self setTrafficEnabled:YES];
        [self setupSubViews];
        [self configureActions];
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _locateButton = [[QMUIButton alloc]qmui_initWithImage:image(@"index_locate_icon") title:nil];
    [self addSubview:_locateButton];
    
    [self.locateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-UIElementSpace);
        make.left.equalTo(self.mas_left).offset(UIElementSpace);
        make.width.height.equalTo(@40);
    }];
    self.zoom_out_btn = [[QMUIButton alloc]qmui_initWithImage:image(@"zoom_out_icon") title:nil];
    [self addSubview:self.zoom_out_btn];
    self.zoom_in_btn = [[QMUIButton alloc]qmui_initWithImage:image(@"zoom_in_icon") title:nil];
    [self addSubview:self.zoom_in_btn];
    [self.zoom_out_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.locateButton.mas_top).offset(-UIElementSpace);
        make.left.equalTo(self.mas_left).offset(UIElementSpace);
        make.width.height.equalTo(@40);
    }];
    [self.zoom_in_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.zoom_out_btn.mas_top).offset(-UIElementSpace);
        make.left.equalTo(self.mas_left).offset(UIElementSpace);
        make.width.height.equalTo(@40);
    }];
}

- (void)configureActions
{
    [super configureActions];
    __weak typeof(self) weakself = self;
    [_locateButton addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        [weakself showMapCenter];
    }];
    [_zoom_in_btn blockEvent:^(QMUIButton *button) {
        [weakself setZoomLevel:self.zoomLevel--];
    }];
    [_zoom_out_btn blockEvent:^(QMUIButton *button) {
        [weakself setZoomLevel:self.zoomLevel++];
    }];
}

/**
 设置 collectionView frame 时布局 pagecontrol 控件 frame
 
 @param frame collectionView 的 frame
 */
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
//    [self layoutLocateButton:_position];
}

/**
 使用Masonry 布局 collectionView 时布局 pagecontrol 控件的frame
 
 @param block collectionView 布局的 MASConstraintMaker block (scope within which you can build up the constraints which you wish to apply to the view.)
 @return Array of created MASConstraints
 */
- (NSArray *)mas_makeConstraints:(void (^)(MASConstraintMaker *))block
{
//    [self layoutLocateButton:_position];
    return [super mas_makeConstraints:block];
}

@end
