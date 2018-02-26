//
//  NSUserDefaults+CLCategory.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "NSUserDefaults+CLCategory.h"

@implementation NSUserDefaults (CLCategory)



+ (BOOL)setObject:(id)obj forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)removeObjectForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)token
{
    NSString * token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//    token = [NSString stringWithFormat:@"%@",token];
    return token;
}

+ (NSString *)phone
{
    NSString * phone = [[NSUserDefaults standardUserDefaults] objectForKey:@"phone"];
    phone = [NSString stringWithFormat:@"%@",phone];
    return phone;
}
+ (NSString *)plateNumber
{
    NSString * plate_num = [[NSUserDefaults standardUserDefaults] objectForKey:@"plateNumber"];
    
    return plate_num?:@" ";
}

+ (NSNumber *)my_order_id
{
    NSNumber * orderIdNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"my_order_id"];
    return orderIdNumber;
}

+ (NSString *)birthday
{
    NSString * birthday = [[NSUserDefaults standardUserDefaults] objectForKey:@"birthday"];
    birthday = [NSString stringWithFormat:@"%@",birthday];
    return birthday;
}
+ (NSString *)img_url
{
    NSString * img_url = [[NSUserDefaults standardUserDefaults] objectForKey:@"img_url"];
    img_url = [NSString stringWithFormat:@"%@",img_url];
    return img_url;;
}
+ (NSString *)nickname
{
    NSString * nickname = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickname"];
    nickname = [NSString stringWithFormat:@"%@",nickname];
    return nickname;
}
+ (NSNumber *)sex
{
    NSNumber * sex =[[NSUserDefaults standardUserDefaults] objectForKey:@"sex"];
    return sex == nil ? [NSNumber numberWithInteger:1] : sex;
}
+ (NSNumber *)follow_num
{
    NSNumber * follow_num =[[NSUserDefaults standardUserDefaults] objectForKey:@"follow_num"];
    return follow_num == nil ? [NSNumber numberWithInteger:0] : follow_num;
}
+ (NSString *)registrationID
{
    NSString * registrationID = [[NSUserDefaults standardUserDefaults] objectForKey:@"registrationID"];
    registrationID = [NSString stringWithFormat:@"%@",registrationID];
    return registrationID;
}
+ (BOOL)clearAll
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * defaultsDic = [defaults dictionaryRepresentation];
    for (id key in defaultsDic.allKeys) {
        [defaults removeObjectForKey:key];
    }
    return [defaults synchronize];
}
+ (NSString *)refresh_token
{
    NSString * refresh_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"refresh_token"];
    refresh_token = [NSString stringWithFormat:@"%@",refresh_token];
    return refresh_token;
}
@end
