//
//  CLMapView.h
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapView.h>

typedef NS_ENUM(NSUInteger, LocateButtonPosition) {
    LocateButtonPositionNone,
    LocateButtonPositionLeftBottom,
    LocateButtonPositionLeftTop,
    LocateButtonPositionRightBottom,
    LocateButtonPositionRightTop,
};

@interface CLMapView : BMKMapView

- (instancetype)initWithLocateButtonPosition:(LocateButtonPosition)position;

//- (void)layoutLocateButton:(LocateButtonPosition)position;
@end
