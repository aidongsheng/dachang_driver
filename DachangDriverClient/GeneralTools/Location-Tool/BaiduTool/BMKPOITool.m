//
//  BMKPOITool.m
//  51carlife
//
//  Created by lijun mou on 2018/1/4.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "BMKPOITool.h"
@interface BMKPOITool()
@property (nonatomic,strong) BMKPoiResult * poiResult;
@property (nonatomic,strong) BMKPoiDetailResult * poiDetailResult;
@property (nonatomic,copy)   poiResultBlock resultBlock;
@end

@implementation BMKPOITool

static BMKPoiSearch * search;
static BMKCitySearchOption * citySearchOption;
static BMKBoundSearchOption * boundSearchOption;
static BMKNearbySearchOption * nearbySearchOption;


+ (BMKPOITool *)shareInstance
{
    static BMKPOITool * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BMKPOITool alloc]init];
    });
    return instance;
}
- (instancetype)init
{
    if (self = [super init]) {
        search = [[BMKPoiSearch alloc]init];
        search.delegate = self;
        citySearchOption = [[BMKCitySearchOption alloc]init];
        citySearchOption.requestPoiAddressInfoList = YES;
        boundSearchOption = [[BMKBoundSearchOption alloc]init];
        nearbySearchOption = [[BMKNearbySearchOption alloc]init];
        _poiResult = [[BMKPoiResult alloc]init];
        citySearchOption.pageCapacity = 50;
        boundSearchOption.pageCapacity = 50;
        nearbySearchOption.pageCapacity = 50;
    }
    return self;
}

- (BOOL)citySearchWithKeyword:(NSString *)keyword inCity:(NSString *)cityName resultBlock:(poiResultBlock)block
{
    citySearchOption.city = cityName;
    citySearchOption.keyword = keyword;
    _resultBlock = block;
    return [search poiSearchInCity:citySearchOption];
}
- (BOOL)boundSearchWithKeyword:(NSString *)keyword LeftBottomCoordinate:(CLLocationCoordinate2D)coordinate1 rightTopCoordinate:(CLLocationCoordinate2D)coordinate2 resultBlock:(poiResultBlock)block
{
    boundSearchOption.leftBottom = coordinate1;
    boundSearchOption.rightTop = coordinate2;
    boundSearchOption.keyword = keyword;
    _resultBlock = block;
    return [search poiSearchInbounds:boundSearchOption];
}
- (BOOL)nearbySearchWithKeyword:(NSString *)keyword Location:(CLLocationCoordinate2D)coordinate inRadius:(int)radius resultBlock:(poiResultBlock)block
{
    nearbySearchOption.location = coordinate;
    nearbySearchOption.radius = radius;
    nearbySearchOption.keyword = keyword;
    _resultBlock = block;
    return [search poiSearchNearBy:nearbySearchOption];
}
#pragma mark - BMKPoiSearchDelegate
/**
 *返回POI搜索结果
 *@param searcher 搜索对象
 *@param poiResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPoiResult*)poiResult errorCode:(BMKSearchErrorCode)errorCode
{
    _resultBlock(searcher,poiResult,errorCode);
}

/**
 *返回POI详情搜索结果
 *@param searcher 搜索对象
 *@param poiDetailResult 详情搜索结果
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiDetailResult:(BMKPoiSearch*)searcher result:(BMKPoiDetailResult*)poiDetailResult errorCode:(BMKSearchErrorCode)errorCode
{
    _poiDetailResult = poiDetailResult;;
}

/**
 *返回POI室内搜索结果
 *@param searcher 搜索对象
 *@param poiIndoorResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiIndoorResult:(BMKPoiSearch*)searcher result:(BMKPoiIndoorResult*)poiIndoorResult errorCode:(BMKSearchErrorCode)errorCode
{
    
}
@end
