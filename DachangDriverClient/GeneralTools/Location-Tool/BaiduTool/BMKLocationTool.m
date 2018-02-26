//
//  LocationManager.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/26.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BMKLocationTool.h"
#import <BMKLocationKit/BMKLocationAuth.h>
@interface BMKLocationTool ()<BMKLocationManagerDelegate,BMKGeoCodeSearchDelegate,BMKLocationAuthDelegate>

@property (nonatomic,strong) BMKReverseGeoCodeResult * result;
@property (nonatomic,copy) startUpdateLocationBlock updateLocationBlock;
@property (nonatomic,copy) reverseGeoCodeResult reGeoBlock;
@end


static NSString * const bmkKey = @"Bjk6tca0ZIMHDv3wPZOi48QHnls1Zkmr";
static BMKLocationManager * locationMgr = nil;
static BMKGeoCodeSearch * search = nil;
static BMKLocationService * service = nil;
static BMKLocationTool * manager = nil;

//设置一个目标经纬度
BMKLocationCoordinateType srctype = BMKLocationCoordinateTypeGCJ02;
BMKLocationCoordinateType destype = BMKLocationCoordinateTypeBMK09LL;

@implementation BMKLocationTool


+ (BMKLocationTool *)shareInstance
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BMKLocationTool alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        locationMgr = [[BMKLocationManager alloc]init];
        locationMgr.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationMgr.allowsBackgroundLocationUpdates = YES;
        locationMgr.activityType = CLActivityTypeFitness;
        locationMgr.locatingWithReGeocode = YES;
        locationMgr.delegate = self;
        locationMgr.pausesLocationUpdatesAutomatically = YES;
        search = [[BMKGeoCodeSearch alloc]init];
        search.delegate = self;
    }
    return self;
}

- (void)startUpdateLocation
{
    [locationMgr startUpdatingLocation];
}

- (void)stopUpdateLocation
{
    [locationMgr stopUpdatingLocation];
}

#pragma mark - 定位服务代理方法
/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error {
    debug_NSLog(@"百度定位错误:%@",error);
}

- (BOOL)adsRequestLocationWithReGeocode:(BOOL)withReGeocode withNetworkState:(BOOL)withNetWorkState completionBlock:(BMKLocatingCompletionBlock)completionBlock {
    [[BMKLocationTool shareInstance] stopUpdateLocation];
    return [locationMgr requestLocationWithReGeocode:withReGeocode withNetworkState:withNetWorkState completionBlock:completionBlock];
}
/**
 *  @brief 连续定位回调函数。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error {
    NSString * address = [NSString stringWithFormat:@"%@%@%@%@%@",location.rgcData.province,location.rgcData.city,location.rgcData.district,location.rgcData.street,location.rgcData.streetNumber];
    debug_NSLog(@"连续定位位置信息:%@,错误信息:%@,地方周围的描述信息:%@",address,error,location.rgcData.locationDescribe);
    
    CLLocationCoordinate2D cood=[BMKLocationManager BMKLocationCoordinateConvert:location.location.coordinate
                                                                         SrcType:srctype DesType:destype];
    CLLocation * convertLoc = [[CLLocation alloc]initWithLatitude:cood.latitude
                                                        longitude:cood.longitude];
    BMKLocation * loc = [[BMKLocation alloc]initWithLocation:convertLoc withRgcData:location.rgcData];
    _updateLocationBlock(manager,loc,error);
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    debug_NSLog(@"定位权限发生改变:%d",status);
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusNotDetermined) {
        QMUIAlertController * showLocationAuthAlert = [QMUIAlertController alertControllerWithTitle:@"定位服务已关闭" message:@"请到设置->隐私->定位服务中开启【51车生活】定位服务，以便司机能够准确获得您的位置信息" preferredStyle:QMUIAlertControllerStyleAlert];
        QMUIAlertAction * cancel = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:^(QMUIAlertAction *action) {
            [showLocationAuthAlert hideWithAnimated:YES];
        }];
        QMUIAlertAction * jumpToSetting = [QMUIAlertAction actionWithTitle:@"设置" style:QMUIAlertActionStyleDefault handler:^(QMUIAlertAction *action) {
            
            
            NSURL * settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if (@available(iOS 10.0, *)) {
                NSURL * settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @NO};
                [[UIApplication sharedApplication] openURL:settingURL options:options completionHandler:nil];
            }else{
                
                if ([[UIApplication sharedApplication] canOpenURL:settingURL]) {
                    [[UIApplication sharedApplication] openURL:settingURL];
                }
            }
        }];
        [showLocationAuthAlert addAction:cancel];
        [showLocationAuthAlert addAction:jumpToSetting];
        [showLocationAuthAlert showWithAnimated:YES];
    }
}


/**
 * @brief 该方法为BMKLocationManager提示需要设备校正回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例。
 */
- (BOOL)BMKLocationManagerShouldDisplayHeadingCalibration:(BMKLocationManager * _Nonnull)manager
{
    return YES;
}

/**
 * @brief 该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param heading 设备的朝向结果
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
          didUpdateHeading:(CLHeading * _Nullable)heading {
    debug_NSLog(@"设备朝向发生改变:%.1f",heading.trueHeading);
}

/**
 * @brief 该方法为BMKLocationManager所在App系统网络状态改变的回调事件。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param state 当前网络状态
 * @param error 错误信息
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
     didUpdateNetworkState:(BMKLocationNetworkState)state
                   orError:(NSError * _Nullable)error
{
    debug_NSLog(@"百度地图网络变化:%i",state);
}

- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher
                    result:(BMKGeoCodeResult *)result
                 errorCode:(BMKSearchErrorCode)error
{
    
    debug_NSLog(@"地址编码结果:<经度:%.3f,纬度:%.3f>，地址:%@",result.location.latitude,result.location.longitude,result.address);
}

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    
    NSString * address = [[[result.addressDetail.city stringByAppendingString:result.addressDetail.district] stringByAppendingString:result.addressDetail.streetName] stringByAppendingString:result.addressDetail.streetNumber];
    
    _reGeoBlock(searcher,result,error);
}

- (void)startUpdateLocationBlock:(startUpdateLocationBlock)block
{
    [[BMKLocationTool shareInstance] startUpdateLocation];
    _updateLocationBlock = block;
}
- (void)reGeoCodeWithCoordinate:(CLLocationCoordinate2D)coordinate reverseGeoCodeResult:(reverseGeoCodeResult)block
{
    BMKReverseGeoCodeOption * option = [[BMKReverseGeoCodeOption alloc]init];
    option.reverseGeoPoint = coordinate;
    [search reverseGeoCode:option];
    _reGeoBlock = block;
}

@end
