//
//  CLOfflineMapManager.m
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CLOfflineMapManager.h"
#import <BaiduMapKit/BaiduMapAPI_Map/BMKOfflineMap.h>

@interface CLOfflineMapManager()<BMKOfflineMapDelegate>


@end

static CLOfflineMapManager * manager = nil;

@implementation CLOfflineMapManager

+ (CLOfflineMapManager *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[CLOfflineMapManager alloc]init];
        }
    });
    return manager;
}

- (int)queryCityIDWithCityName:(NSString *)cityName
{
    return 0;
}

- (BOOL)downloadOfflineMapWithCityID:(int)cityID
{
    return YES;
}

- (void)onGetOfflineMapState:(int)type withState:(int)state
{
    
}


@end
