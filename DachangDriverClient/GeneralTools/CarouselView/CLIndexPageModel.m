//
//  CLIndexPageModel.m
//  51carlife
//
//  Created by lijun mou on 2018/1/29.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CLIndexPageModel.h"

@implementation CLIndexPageModel

@end

@implementation CLIndexPageAidsModel

@end

@implementation CLIndexPageAidItemModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    [super setValue:value forUndefinedKey:key];
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"item_id"];
        
    }
}
@end

@implementation CLIndexPageRequest
- (NSString *)requestUrl {
    return @"api/ads";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
- (id)jsonValidator {
    return @{
             @"total":[NSNumber class],
             @"ads":@{
                     @"id":[NSNumber class],
                     @"title":[NSString class],
                     @"linkurl":[NSString class],
                     @"picurl":[NSString class],
                     @"adstype":[NSNumber class],
                     @"aid":[NSString class]
                     }
             };
}
@end
