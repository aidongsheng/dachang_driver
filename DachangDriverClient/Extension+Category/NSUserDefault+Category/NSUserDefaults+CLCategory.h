//
//  NSUserDefaults+CLCategory.h
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (CLCategory)

+ (BOOL)setObject:(id)obj forKey:(NSString *)key;
+ (BOOL)removeObjectForKey:(NSString *)key;
+ (NSString *)token;
+ (NSString *)phone;
+ (NSString *)plateNumber;
+ (NSNumber *)my_order_id;
+ (NSString *)birthday;
+ (NSString *)nickname;
+ (NSNumber *)sex;
+ (NSString *)img_url;
+ (NSNumber *)follow_num;
+ (NSString *)registrationID;
+ (NSString *)refresh_token;
+ (BOOL)clearAll;
@end
