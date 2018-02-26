//
//  CLOfflineMapManager.h
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLOfflineMapManager : NSObject

+ (CLOfflineMapManager *)shareInstance;

- (BOOL)downloadOfflineMapWithCityID:(int)cityID;

- (int)queryCityIDWithCityName:(NSString *)cityName;

@end
