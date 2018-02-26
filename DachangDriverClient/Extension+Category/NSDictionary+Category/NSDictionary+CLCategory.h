//
//  NSDictionary+CLCategory.h
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CLCategory)
// 将字符串转换为字典
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
