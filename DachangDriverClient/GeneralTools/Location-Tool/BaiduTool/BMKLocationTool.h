//
//  LocationManager.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/26.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <BMKLocationKit/BMKLocationManager.h>
#import <BMKLocationKit/BMKLocation.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

typedef void(^startUpdateLocationBlock)(BMKLocationManager * _Nonnull manager,BMKLocation * _Nullable location,NSError * _Nullable error);
typedef void(^reverseGeoCodeResult)(BMKGeoCodeSearch * _Nullable searcher,BMKReverseGeoCodeResult *   _Nullable result,BMKSearchErrorCode error);
@interface BMKLocationTool : NSObject


+ (BMKLocationTool *_Nullable)shareInstance;

//  开始连续定位
- (void)startUpdateLocation;
//  停止连续定位
- (void)stopUpdateLocation;
//  获取当前位置地址信息
- (void)reGeoCodeWithCoordinate:(CLLocationCoordinate2D)coordinate  reverseGeoCodeResult:(reverseGeoCodeResult _Nullable )block;
//  连续定位附带block回调
- (void)startUpdateLocationBlock:(startUpdateLocationBlock _Nullable )block;

- (BOOL)adsRequestLocationWithReGeocode:(BOOL)withReGeocode withNetworkState:(BOOL)withNetWorkState completionBlock:(BMKLocatingCompletionBlock _Nonnull)completionBlock;
@end
