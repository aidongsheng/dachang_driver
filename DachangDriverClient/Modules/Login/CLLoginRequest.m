//
//  CLLoginRequest.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CLLoginRequest.h"

@implementation GetVertifyRequest

- (id)initWithPhone:(NSString *)phone
{
    if (self = [super init]) {
        _phone = phone;
    }
    return self;
}

- (NSString *)baseUrl
{
    return CLBaseUrl;
}

- (NSString *)requestUrl
{
    return @"/api/send_code";
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (id)jsonValidator
{
    return @{
        @"success": [NSNumber class],
        @"type": [NSString class],
        @"message": [NSString class]
        };
}
- (id)requestArgument
{
    return @{
             @"mobile": _phone,
             };
}
@end


@implementation DCDriverLoginRequest
- (id)initWithPhone:(NSString *)phone password:(NSString *)password
{
    if (self = [super init]) {
        _phone = phone;
        _password = password;
    }
    return self;
}

- (NSString *)baseUrl
{
    return CLBaseUrl;
}

- (NSString *)requestUrl
{
    return @"api/driver/login";
}

- (id)jsonValidator
{
    return @{
             @"status":[NSString class],
             @"msg":@{
                     @"token":[NSString class],
                     @"phone":[NSString class],
                     @"img_url":[NSString class]
                     }
             };
}
- (id)requestArgument
{
    return @{
             @"phone": _phone,
             @"password":_password,
             @"type":@(_type)
             };
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

@end

@implementation CLLoginRefreshTokenRequest

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (NSString *)requestUrl
{
    return @"/api/user/auth/refresh";
}
- (id)jsonValidator
{
    return @{
             @"access_token":[NSString class],
             @"token_type":[NSString class],
             @"expires_in":[NSNumber class]
             };
}
- (id)requestArgument
{
    return @{@"refresh_token":[NSString stringWithFormat:@"%@",[NSUserDefaults refresh_token]]};
}

@end


@implementation CLLogoutRequest

- (id)initWithRegistrationID:(NSString *)registrationID{
    if (self = [super init]) {
        _registrationid = registrationID;
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/auth/logout";
}
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)jsonValidator
{
    return @{@"message":[NSString class]};
}
- (id)requestArgument
{
    return @{@"registration_id":[NSString stringWithFormat:@"%@",_registrationid]};
}
@end

@implementation CLUserInfoRequest

- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/user_info";
}
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}
- (id)jsonValidator{
    return @{
             @"data": @{
                     @"phone": [NSString class],     //手机号
                     @"nick_name": [NSString class],        //昵称
                     @"head_img_url": [NSString class],     //头像地址
                     @"sex": [NSNumber class],                 //性别   1：男，2：女
                     }
             };
}

- (BOOL)writeCacheAsynchronously
{
    return YES;
}
- (NSInteger)cacheTimeInSeconds
{
    return 5;
}
@end


@implementation CLUpdateNicknameRequest

- (id)initWithNickname:(NSString *)nickname
{
    if (self = [super init]) {
        _nickname = nickname;
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/user_info/update";
}
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)requestArgument
{
    return @{
             @"nick_name":[NSString stringWithFormat:@"%@",_nickname],
             };
}
- (id)jsonValidator
{
    return @{
             @"message": [NSString class],
             @"errors": [NSDictionary class]
             };
}
@end

@implementation CLUpdateHeadImgUrlRequest
- (id)initWithHeadImgUrl:(NSString *)HeadImgUrl
{
    if (self = [super init]) {
        _head_img_url = HeadImgUrl;
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/user_info/update";
}
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)requestArgument
{
    return @{
             @"head_img_url":[NSString stringWithFormat:@"%@",_head_img_url],
             };
}
- (id)jsonValidator
{
    return @{
             @"message": [NSString class],
             @"errors": [NSDictionary class]
             };
}
@end


@implementation CLUpdateBirthdayRequest
- (id)initWithBirthday:(NSString *)Birthday
{
    if (self = [super init]) {
        _birthday = Birthday;
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/user_info/update";
}
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)requestArgument
{
    return @{
             @"birthday":[NSString stringWithFormat:@"%@",_birthday]
             };
}
- (id)jsonValidator
{
    return @{
             @"message": [NSString class],
             @"errors": [NSDictionary class]
             };
}
@end


@implementation CLUpdateSexRequest
- (id)initWithSex:(NSNumber *)sex
{
    if (self = [super init]) {
        _sex = sex;
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/user_info/update";
}
- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)requestArgument
{
    return @{
             @"sex":_sex
             };
}
- (id)jsonValidator
{
    return @{
             @"message": [NSString class],
             @"errors": [NSDictionary class]
             };
}
@end

@implementation CLUserUploadAvatarRequest


- (id)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        _image = image;
    }
    return self;
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (NSString *)requestUrl
{
    return @"/api/user/image";
}

- (id)jsonValidator
{
    return @{
             @"msg":[NSString class],
             @"status":[NSNumber class]
             };
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (YTKRequestMethod)requestMethod
{
    
    return YTKRequestMethodPOST;
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(_image, 0.3);
        NSString *type = @"image/jpeg";
        NSDate * date = [NSDate date];
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString * dateString = [formatter stringFromDate:date];
        NSString * fileName = [NSString stringWithFormat:@"%@.jpg",dateString];
        [formData appendPartWithFileData:data name:@"img" fileName:fileName mimeType:type];
    };
}
@end

@implementation CLUserInfoUpdateRequest
- (id)initWithUserInfo:(CLUserInfoModel *)model
{
    if(self = [super init]){
        _model = model;
        
    }
    return self;
}
- (id)requestArgument
{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params setObject:_model.data.birthday==nil?@"":_model.data.birthday forKey:@"birthday"];
    [params setObject:_model.data.sex==nil?@1:_model.data.sex forKey:@"sex"];
    [params setObject:_model.data.head_img_url==nil?@"":_model.data.head_img_url forKey:@"head_img_url"];
    [params setObject:_model.data.nick_name==nil?@"":_model.data.nick_name forKey:@"nick_name"];
    
    return params;
}
- (NSString *)requestUrl {
    return @"/api/user/user_info/update";
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

@end

