//
//  VPStorageManager.h
//  VillagePlay
//
//  Created by Apricot on 16/10/18.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface VPStorageManager : NSObject

#pragma mark - 登录模块

/**
 保存登录信息

 @param loginInfo 登录信息
 */
+ (void)saveLoginInfo:(NSDictionary *)loginInfo;

/**
 获取本地的登录信息

 @return 登录的用户信息
 */
+ (NSDictionary *)loadLoginInfo;

/**
 删除登录信息
 */
+ (void)deleteLoginInfo;

#pragma mark - User模块
/**
 *  存储用户信息
 *
 *  @param userInfo 用户信息
 */
+ (void)saveUserInfo:(UserInfoModel *)userInfo;

/**
 *  获取本地的用户信息
 *
 *  @return 用户信息
 */
+ (UserInfoModel *)loadUserInfo;

/**
 *  删除用户信息
 */
+ (void)deleteUserInfo;

/**
 保存俱乐部ID

 @param clubId 俱乐部id
 */
+ (void)saveClubId:(NSString *)clubId;

/**
 获取俱乐部id
 
 @return 俱乐部id
 */
+ (NSString *)loadClubId;

/**
 删除俱乐部id
 */
+ (void)deleteClubId;


/**
 *  存储搜索记录
 *
 *  @param searchRecord 搜索记录
 */
+ (void)saveSearchRecord:(NSString *)searchRecord;

/**
 *  获取所有的搜索记录
 *
 *  @return 所有的搜索记录
 */
+ (NSArray *)loadSearchRecord;

/**
 *  删除搜索记录
 */
+ (void)deleteSearchRecord;

/**
 保存环信的信息 @{@""}

 @param easeInfo 环信相关的信息
 */
+ (void)saveEaseNickAndPhoto:(NSDictionary *)easeInfo;

/**
 加载环信的相关信息

 @return 返回环信相关的信息
 */
+ (NSDictionary *)loadEaseNickAndPhoto;

/**
 删除环信相关的信息
 */
+ (void)deleteEaseNickAndPhoto;

/**
 记录评论的红点数

 @param count 数量(目前项目未使用到)
 */
+ (void)saveCommentBadgeCount:(NSInteger)count;

/**
 获取当前评论的红点数量

 @return 返回评论的红点数量
 */
+ (NSInteger)loadCommentBadgeCount;

/**
 删除红点数量
 */
+ (void)deleteCommentBadgeCount;

@end
