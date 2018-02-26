//
//  NSString+CLCategory.h
//  51carlife
//
//  Created by lijun mou on 2017/12/13.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLCategory)
//  生成 md5 字符串
+ (NSString *)md5StringFromString:(NSString *)string;

/**
 验证车牌号格式是否合法

 @return 是否合法
 */
- (BOOL)isValidPlatesNumber;

@end
