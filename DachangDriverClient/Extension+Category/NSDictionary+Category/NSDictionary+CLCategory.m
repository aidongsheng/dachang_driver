//
//  NSDictionary+CLCategory.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "NSDictionary+CLCategory.h"
#import <objc/runtime.h>

@implementation NSDictionary (CLCategory)

+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
