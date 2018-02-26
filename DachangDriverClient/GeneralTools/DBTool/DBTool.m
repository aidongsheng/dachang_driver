//
//  DBTool.m
//  51carlife
//
//  Created by lijun mou on 2018/1/6.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "DBTool.h"
#import <FMDB.h>

static FMDatabase *         Database;
static FMDatabaseQueue *    DBQueue;
static DBTool *             instance;
static NSString * const     DBCompoment = @"carlife.db";
static NSString * const     DBOpenFailedError = @"数据库打开失败提示!";
static NSString * const     TableCreateFailedError = @"表创建失败提示!";
static NSString * const     InsertKeywordFailedError = @"关键词插入数据库失败提示!";
//  创建目的地关键字表SQL语句
static NSString * const     createStorageDestinationTable = @"create table if not exists DestinationKeyword (keyword str)";
//  检索目的地关键字的SQL语句
static NSString * const     queryDestinationKeywordSQL = @"select * from DestinationKeyword";



static NSString * const kUserInfoTableName = @"UserInfo";
//  创建用户资料表SQL语句
static NSString * const     createUserInfoTable = @"create table if not exists %@ (phone INTEGER,nick_name TEXT,sex INTEGER,birthday TEXT,head_img_url TEXT,registrationid TEXT,member_level INTEGER,follow_num INTEGER,scores INTEGER)";
//  检索用户资料的SQL语句
static NSString * const     queryUserInfoSQL = @"select * from UserInfo";
//  更新用户资料SQL语句
static NSString * const     updateUserInfoSQL = @"update %@ set phone=?,nick_name=?,sex=?,birthday=?,head_img_url=?,registrationid=?,member_level=?,follow_num=?,scores=?";
@implementation DBTool

+ (DBTool *)shareTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[DBTool alloc]init];
        }
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        path = [path stringByAppendingPathComponent:DBCompoment];
        DBQueue = [FMDatabaseQueue databaseQueueWithPath:path];
        Database =  [FMDatabase databaseWithPath:path];
        if ([self isTableOK:kUserInfoTableName]) {
            
        }else{
            [self createUserInfo];
        }
        
    }
    return self;
}

// 判断是否存在表
- (BOOL)isTableOK:(NSString *)tableName
{
    FMResultSet *rs = [Database executeQuery:@"SELECT count(*) as 'count' FROM sqlite_master WHERE type ='table' and name = ?", tableName];
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        debug_NSLog(@"isTableOK %li", count);
        if (0 == count){
            return NO;
        }
        else{
            return YES;
        }
    }
    return NO;
}

- (BOOL)storageDestinationKeyword:(NSString *)destinationKeyword
{
    if ([Database open]) {
        if ([Database executeStatements:createStorageDestinationTable]) {
            NSString * insertDestinationKeywordSQL = [NSString stringWithFormat:@"insert into DestinationKeyword values(?)"];
            NSArray * exsitedKeywords = [[DBTool shareTool] queryAllDestinationKeyword];
            if (![exsitedKeywords containsObject:destinationKeyword] && ![destinationKeyword isEqualToString:@""] && destinationKeyword != nil) {
                if ([Database executeUpdate:insertDestinationKeywordSQL,destinationKeyword]) {
                    [self showSuccess:@"关键词保存成功"];
                    [Database close];
                    return YES;
                }else{
                    [self showError:InsertKeywordFailedError];
                    return NO;
                }
            }else{
                [self showError:@"关键词已存在"];
                return NO;
            }
        }else{
            [self showError:TableCreateFailedError];
            return NO;
        }
    }else{
        [self showError:DBOpenFailedError];
        [Database close];
        return NO;
    }
}
- (NSArray *)queryRecentDestinationKeyword
{
    if ([Database open]) {
        FMResultSet * destinationKeywords = [Database executeQuery:queryDestinationKeywordSQL];
        NSMutableArray * keywords = [[NSMutableArray alloc]init];
        while ([destinationKeywords next]) {
            NSString * keyword = [destinationKeywords stringForColumn:@"keyword"];
            [keywords addObject:keyword];
        }
        NSInteger keywordsArrayLength = keywords.count;
        NSArray * recentKeywords = [[NSArray alloc]init];
        if (keywordsArrayLength > 5) {
            recentKeywords = [keywords subarrayWithRange:NSMakeRange(keywordsArrayLength-5, 5)];
        }else{
            recentKeywords = keywords;
        }
        recentKeywords = [[recentKeywords reverseObjectEnumerator] allObjects];
        [Database close];
        return recentKeywords;
    }else{
        [self showError:DBOpenFailedError];
        [Database close];
        return nil;
    }
}
- (NSArray *)queryAllDestinationKeyword
{
    if ([Database open]) {
        FMResultSet * destinationKeywords = [Database executeQuery:queryDestinationKeywordSQL];
        NSMutableArray * keywords = [[NSMutableArray alloc]init];
        while ([destinationKeywords next]) {
            NSString * keyword = [destinationKeywords stringForColumn:@"keyword"];
            [keywords addObject:keyword];
        }
        [Database close];
        return keywords;
    }else{
        [self showError:DBOpenFailedError];
        [Database close];
        return nil;
    }
}
- (void)showError:(NSString *)text
{
    [QMUITips showError:text inView:keyWindow hideAfterDelay:1];
}
- (void)showSuccess:(NSString *)text
{
    [QMUITips showSucceed:text inView:keyWindow hideAfterDelay:1];
}
- (BOOL)removeDestinationKeywordAllObjects
{
    return [Database executeUpdate:@"delete from DestinationKeyword"];
}
/**
 存储用户资料
 
 @return 创建用户表是否成功标志
 */
- (BOOL)createUserInfo
{
    if ([Database open]) {
        if ([Database executeStatements:[NSString stringWithFormat:createUserInfoTable,kUserInfoTableName]]) {
//            [self showSuccess:@"创建用户表成功"];
            [Database close];
            return YES;
        }else{
            [self showError:@"创建用户表失败"];
            return NO;
        }
    }else{
        [self showError:DBOpenFailedError];
        [Database close];
        return NO;
    }
}

- (BOOL)removeUserInfoAllObjects
{
    return [Database executeUpdate:@"delete from UserInfo"];
}

- (NSString *)queryRegistrationID
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSString * registrationid = resultDic[@"registrationid"];
        return registrationid;
    }else{
        return nil;
    }
}
- (BOOL)storageRegistrationID:(NSString *)registrationID
{
    if ([Database open]) {
        NSString * updateRegistrationIDSQL = [NSString stringWithFormat:@"update UserInfo set registrationid=?"];
        [Database executeUpdate:updateRegistrationIDSQL,registrationID];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}

- (NSNumber *)queryPhone
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSNumber * phone = resultDic[@"phone"];
        return phone;
    }else{
        return nil;
    }
}
- (BOOL)storagePhone:(NSNumber *)Phone
{
    if ([Database open]) {
        NSString * updatePhone = [NSString stringWithFormat:@"update UserInfo set phone=?"];
        [Database executeUpdate:updatePhone,Phone];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (NSNumber *)querySex
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSNumber * sex = resultDic[@"sex"];
        return sex;
    }else{
        return nil;
    }
}
- (BOOL)storageSex:(NSNumber *)sex
{
    if ([Database open]) {
        NSString * updateSex = [NSString stringWithFormat:@"update UserInfo set sex=?"];
        [Database executeUpdate:updateSex,sex];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (NSNumber *)queryMember_level
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSNumber * member_level = resultDic[@"member_level"];
        return member_level;
    }else{
        return nil;
    }
}
- (BOOL)storageMember_level:(NSNumber *)member_level
{
    if ([Database open]) {
        NSString * updateMember_level = [NSString stringWithFormat:@"update UserInfo set member_level=?"];
        [Database executeUpdate:updateMember_level,member_level];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (NSNumber *)queryFollowNum
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSNumber * follow_num = resultDic[@"follow_num"];
        return follow_num;
    }else{
        return nil;
    }
}
- (BOOL)storageFollowNum:(NSNumber *)followNum
{
    if ([Database open]) {
        NSString * updateFollowNum = [NSString stringWithFormat:@"update UserInfo set follow_num=?"];
        [Database executeUpdate:updateFollowNum,followNum];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}

- (NSString *)queryBirthday
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:queryUserInfoSQL];
        while ([result next]) {
            NSString * birthday = [result stringForColumn:@"birthday"];
            debug_NSLog(@"生日:%@",birthday);
        }
        return @"";
    }else{
        return nil;
    }
}
- (BOOL)storageBirthday:(NSString *)birthday
{
    if ([Database open]) {
        NSString * updateBirthday = [NSString stringWithFormat:@"update UserInfo set birthday=?"];
        if ([Database executeUpdate:updateBirthday,birthday]) {
            debug_NSLog(@"存储生日成功");
        }else{
            debug_NSLog(@"存储生日失败");
        }
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (NSString *)queryHead_img_url
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSString * head_img_url = resultDic[@"head_img_url"];
        return head_img_url;
    }else{
        return nil;
    }
}
- (BOOL)storageHead_img_url:(NSString *)head_img_url
{
    if ([Database open]) {
        NSString * updateHead_img_url = [NSString stringWithFormat:@"update UserInfo set head_img_url=?"];
        [Database executeUpdate:updateHead_img_url,head_img_url];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (NSString *)queryNickname
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
//        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
//        NSString * nick_name = resultDic[@"nick_name"];
//
        while ([result next]) {
            NSString * nickname = [result stringForColumn:@"nick_name"];
            debug_NSLog(@"nickname = :%@",nickname);
        }
        
        return @"nick_name";
    }else{
        return nil;
    }
}
- (BOOL)storageNick_name:(NSString *)nick_name
{
    if ([Database open]) {
        NSString * updateNickname = [NSString stringWithFormat:@"update UserInfo set nick_name=?"];
        [Database executeUpdate:updateNickname,nick_name];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (BOOL)storageScores:(NSNumber *)scores
{
    if ([Database open]) {
        NSString * updateScores = [NSString stringWithFormat:@"update UserInfo set scores=?"];
        [Database executeUpdate:updateScores,scores];
        [Database close];
        return YES;
    }else{
        [Database close];
        return NO;
    }
}
- (NSNumber *)queryScores
{
    if ([Database open]) {
        FMResultSet *result = [Database executeQuery:[NSString stringWithFormat:@"select * from %@",kUserInfoTableName]];
        NSMutableDictionary * resultDic = [result columnNameToIndexMap];
        NSNumber * scores = resultDic[@"scores"];
        return scores;
    }else{
        return nil;
    }
}
@end

