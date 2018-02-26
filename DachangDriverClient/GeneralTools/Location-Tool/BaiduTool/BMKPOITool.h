//
//  BMKPOITool.h
//  51carlife
//
//  Created by lijun mou on 2018/1/4.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^poiResultBlock)(BMKPoiSearch* searcher,BMKPoiResult * result, BMKSearchErrorCode errorCode);
@interface BMKPOITool : NSObject<BMKPoiSearchDelegate,BMKSuggestionSearchDelegate>
+ (BMKPOITool *)shareInstance;

- (BOOL)boundSearchWithKeyword:(NSString *)keyword LeftBottomCoordinate:(CLLocationCoordinate2D)coordinate1
                                   rightTopCoordinate:(CLLocationCoordinate2D)coordinate2 resultBlock:(poiResultBlock)block;

- (BOOL)citySearchWithKeyword:(NSString *)keyword inCity:(NSString *)cityName resultBlock:(poiResultBlock)block;

- (BOOL)nearbySearchWithKeyword:(NSString *)keyword Location:(CLLocationCoordinate2D)coordinate inRadius:(int)radius resultBlock:(poiResultBlock)block;
@end
