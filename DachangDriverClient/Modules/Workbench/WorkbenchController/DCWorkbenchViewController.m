//
//  DCWorkbenchViewController.m
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/25.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "DCWorkbenchViewController.h"

@interface DCWorkbenchViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
@property (nonatomic,strong) BMKMapView * mapView;
@property (nonatomic,strong) QMUIButton * startTakingOrderBtn;
@property (nonatomic,strong) BMKLocationService * service;
@property (nonatomic,assign) NSInteger takingOrderStatus;
@end

@implementation DCWorkbenchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}
- (void)setupSubViews
{
    [super setupSubViews];
    _mapView = [[BMKMapView alloc]init];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    _mapView.rotateEnabled = NO;
    _mapView.overlookEnabled = NO;
    _mapView.logoPosition = BMKLogoPositionLeftTop;
    _service = [[BMKLocationService alloc]init];
    _service.distanceFilter = 10;
    _service.delegate = self;
    [_service startUserLocationService];
    _service.allowsBackgroundLocationUpdates = YES;
    
    [self.view addSubview:_mapView];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [_mapView showMapCenter];
    _startTakingOrderBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"开始接单"];
    [_startTakingOrderBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
    _startTakingOrderBtn.titleLabel.font = [UIFont PingFangSCMediumFontSize:14];
    _startTakingOrderBtn.backgroundColor = naviBar_tint_color;
    _startTakingOrderBtn.layer.cornerRadius = 40;
    [self.view addSubview:_startTakingOrderBtn];
    [_startTakingOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@80);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    [_startTakingOrderBtn blockEvent:^(QMUIButton *button) {
        DCChangeTakingOrderStatusRequest * req = [[DCChangeTakingOrderStatusRequest alloc]initWithStatus:!_takingOrderStatus];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
            [self showInfo:info[@"msg"]];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        }];
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupDataSource];
    
}
- (void)setupDataSource
{
    [super setupDataSource];
    DCFetchTakingOrderRequest * req = [[DCFetchTakingOrderRequest alloc]init];
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
        NSInteger status = [info[@"status"] integerValue];
        if (status == 1) {
            [_startTakingOrderBtn setTitle:@"开始接单" forState:UIControlStateNormal];
            [_startTakingOrderBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
            _takingOrderStatus = 1;
        }else{
            [_startTakingOrderBtn setTitle:@"停止接单" forState:UIControlStateNormal];
            [_startTakingOrderBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
            _takingOrderStatus = 0;
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    
}
#pragma mark - 百度地图服务代理
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    [_mapView updateLocationData:userLocation];
    userLocation.title = @"我的位置";
    _mapView.showMapScaleBar = YES;
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    static NSString * identifier = @"my_location_id";
    BMKAnnotationView * point = (BMKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!point) {
        point = [[BMKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    point.image = image(@"baidu_user_icon");
    return point;
}


@end
