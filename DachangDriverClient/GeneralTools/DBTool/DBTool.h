//
//  DBTool.h
//  51carlife
//
//  Created by lijun mou on 2018/1/6.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLUserInfoModel.h"

@interface DBTool : NSObject

/**
 fmdb数据库管理工具单例

 @return fmdb数据库管理工具
 */
+ (DBTool *)shareTool;


/**
 存储关键词数据

 @param destinationKeyword 等待存储的关键词
 @return 存储关键词是否成功
 */
- (BOOL)storageDestinationKeyword:(NSString *)destinationKeyword;

/**
 检索最近关键词搜索记录

 @return 最近搜索记录
 */
- (NSArray *)queryRecentDestinationKeyword;

/**
 检索所有关键词搜索记录

 @return 所有搜索记录
 */
- (NSArray *)queryAllDestinationKeyword;

/**
 删除所有关键词搜索记录

 @return 是否删除成功标志
 */
- (BOOL)removeDestinationKeywordAllObjects;

/**
 清楚全部用户资料

 @return 清理用户资料是否成功
 */
- (BOOL)removeUserInfoAllObjects;


/**
 获取极光registrationID

 @return 极光registrationID
 */
- (NSString *)queryRegistrationID;

/**
 存储极光registrationID

 @param registrationID 极光注册ID
 @return 存储是否成功标记
 */
- (BOOL)storageRegistrationID:(NSString *)registrationID;
/**
 获取手机号码
 
 @return 手机号码
 */
- (NSNumber *)queryPhone;

/**
 存储手机号码
 
 @param Phone 手机号
 @return 存储手机号是否成功标记
 */
- (BOOL)storagePhone:(NSNumber *)Phone;
/**
 获取性别
 
 @return 性别
 */
- (NSNumber *)querySex;

/**
 存储性别
 
 @param sex 性别
 @return 存储性别是否成功标记
 */
- (BOOL)storageSex:(NSNumber *)sex;
/**
 获取性别
 
 @return 性别
 */
- (NSNumber *)queryFollowNum;

/**
 存储粉丝数
 
 @param followNum 粉丝数
 @return 存储粉丝数是否成功标记
 */
- (BOOL)storageFollowNum:(NSNumber *)followNum;
/**
 获取生日
 
 @return 生日日期
 */
- (NSString *)queryBirthday;

/**
 存储生日
 
 @param birthday 生日
 @return 存储生日是否成功标记
 */
- (BOOL)storageBirthday:(NSString *)birthday;

/**
 获取头像URL
 
 @return 生日日期
 */
- (NSString *)queryHead_img_url;

/**
 存储生日
 
 @param head_img_url 头像URL
 @return 存储头像URL是否成功标记
 */
- (BOOL)storageHead_img_url:(NSString *)head_img_url;


/**
 获取头像URL
 
 @return 会员等级
 */
- (NSNumber *)queryMember_level;

/**
 存储生日
 
 @param member_level 会员等级
 @return 存储头像URL是否成功标记
 */
- (BOOL)storageMember_level:(NSNumber *)member_level;

/**
 获取scores
 
 @return scores
 */
- (NSNumber *)queryScores;

/**
 存储scores
 
 @param scores 分数
 @return 存储 scores 是否成功标记
 */
- (BOOL)storageScores:(NSNumber *)scores;

/**
 查询昵称

 @return 昵称
 */
- (NSString *)queryNickname;

/**
 存储用户昵称

 @param nick_name 昵称
 @return 存储用户昵称是否成功
 */
- (BOOL)storageNick_name:(NSString *)nick_name;
@end




