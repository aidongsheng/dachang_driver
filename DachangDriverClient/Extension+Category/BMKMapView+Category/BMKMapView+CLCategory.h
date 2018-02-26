//
//  BMKMapView+CLCategory.h
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapView.h>

typedef NS_ENUM(NSUInteger, BMKMapViewPointPosition) {
    BMKMapViewPointPositionTopLeft,
    BMKMapViewPointPositionTopRight,
    BMKMapViewPointPositionBottomLeft,
    BMKMapViewPointPositionBottomRight,
    BMKMapViewPointPositionCenter,
};

@interface BMKMapView (CLCategory)<BMKMapViewDelegate>

- (void)showMapCenter;

/**
 根据地图四个边角点，获取对应的经纬度坐标

 @param pointPosition 角的枚举值
 @return 获取到的经纬度值
 */
- (CLLocationCoordinate2D)getCoordinate:(BMKMapViewPointPosition)pointPosition;

/**
 获取地图上的某个点的 CGPoint 值

 @param position 某个点的位置枚举值
 @return 获取到的 CGPoint 值
 */
- (CGPoint)getPointAt:(BMKMapViewPointPosition)position;
- (BMKMapRect)mapRectWithAnnotations:(NSArray *)annotations;
@end
