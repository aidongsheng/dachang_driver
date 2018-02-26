//
//  CLUserInfoModel.h
//  51carlife
//
//  Created by lijun mou on 2018/1/8.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YTKNetwork.h>

@class UserData;
@interface CLUserInfoModel : NSObject
@property (nonatomic,strong) UserData * data;
@end

@interface UserData : NSObject
@property (nonatomic,copy)   NSString *nick_name;
@property (nonatomic,copy)   NSString *head_img_url;
@property (nonatomic,copy)   NSString *birthday;
@property (nonatomic,strong) NSNumber * sex;
@property (nonatomic,copy)   NSString * phone;
@end

@interface MloginRequest : YTKRequest{
    NSString * _account;
    NSString * _password;
    NSString * _code;
    NSInteger  _type;
}
- (id)initWithAccount:(NSString *)account password:(NSString *)password type:(NSInteger)type code:(NSString *)code;
@end
