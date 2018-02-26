//
//  NSString+CLCategory.m
//  51carlife
//
//  Created by lijun mou on 2017/12/13.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "NSString+CLCategory.h"

@implementation NSString (CLCategory)

+ (NSString *)md5StringFromString:(NSString *)string {
    NSParameterAssert(string != nil && [string length] > 0);
    
    const char *value = [string UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x", outputBuffer[count]];
    }
    
    return outputString;
}
- (BOOL)isValidPlatesNumber
{
    
    //正则表达式匹配全国车牌号码
    NSString *regex = @"^[\u4e00-\u9fa5]{1}[A-Za-z]{1}[A-Za-z0-9]{5}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

@end
