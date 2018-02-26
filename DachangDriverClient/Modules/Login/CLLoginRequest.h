//
//  CLLoginRequest.h
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "CLUserInfoModel.h"

@class DCDriverLoginRequest;

// 获取验证码接口
@interface GetVertifyRequest : YTKRequest{
    NSString * _phone;
}

- (id)initWithPhone:(NSString *)phone;

@end

// 登录接口
@interface DCDriverLoginRequest : GetVertifyRequest {
    NSString * _account;
    NSString * _password;
    NSInteger _type;
    NSString * _code;
}
- (id)initWithPhone:(NSString *)phone password:(NSString *)password;
@end

//  刷新 token
@interface CLLoginRefreshTokenRequest : YTKRequest

@end
//  注销接口
@interface CLLogoutRequest : YTKRequest{
    NSString * _registrationid;
}
- (id)initWithRegistrationID:(NSString *)registrationID;
@end
// 用户信息接口
@interface CLUserInfoRequest :YTKRequest
- (id)init;
@end

//  更新用户昵称
@interface CLUpdateNicknameRequest : YTKRequest{
    NSString * _nickname;
    NSString * _head_img_url;
    NSString * _birthday;
    NSNumber * _sex;
}
- (id)initWithNickname:(NSString *)nickname;
@end

//  更新用户头像
@interface CLUpdateHeadImgUrlRequest : YTKRequest{
    NSString * _head_img_url;
}
- (id)initWithHeadImgUrl:(NSString *)HeadImgUrl;
@end

//  更新用户生日
@interface CLUpdateBirthdayRequest : YTKRequest{
    NSString * _birthday;
}
- (id)initWithBirthday:(NSString *)Birthday;
@end
//  更新用户性别
@interface CLUpdateSexRequest : YTKRequest{
    NSNumber * _sex;
}
- (id)initWithSex:(NSNumber *)sex;
@end

@interface CLUserUploadAvatarRequest : YTKRequest{
    UIImage * _image;
}

- (id)initWithImage:(UIImage *)image;

@end

//  更新用户信息
@interface CLUserInfoUpdateRequest : YTKRequest{
    CLUserInfoModel * _model;
}
- (id)initWithUserInfo:(CLUserInfoModel *)model;

@end
