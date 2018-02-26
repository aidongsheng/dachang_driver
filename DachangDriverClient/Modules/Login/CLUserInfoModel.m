//
//  CLUserInfoModel.m
//  51carlife
//
//  Created by lijun mou on 2018/1/8.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CLUserInfoModel.h"

@implementation CLUserInfoModel
@end

@implementation UserData
@end

@implementation MloginRequest
- (id)initWithAccount:(NSString *)account password:(NSString *)password type:(NSInteger)type code:(NSString *)code
{
    if (self = [super init]) {
        _account = account;
        _password = password;
        _type = type;
        _code = code;
    }
    return self;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (NSString *)requestUrl
{
    return @"/api/shop/login";
}
- (id)requestArgument
{
    return @{@"account":_account,@"code":_code,@"password":_password,@"type":@(_type)};
}
- (id)jsonValidator
{
    return @{
        @"status": [NSNumber class],
        @"msg": @{
            @"token": [NSString class],//用户唯一标识
            @"phone": [NSString class],//手机号
            @"img_url": [NSString class]//头像
        }
        };
}

@end
