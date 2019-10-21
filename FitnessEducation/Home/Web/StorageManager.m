//
//  VPStorageManager.m
//  VillagePlay
//
//  Created by Apricot on 16/10/18.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "StorageManager.h"
#import "QMStorageManage.h"
#import <YYModel.h>

/**
 *  登录信息的KEY
 */
static NSString * const KLoginInfo = @"K_LoginInfo";

/**
 *  用户信息的KEY
 */
static NSString * const KUserInfo = @"K_UserInfo";

/**
 *  搜索记录的KEY
 */
static NSString * const KSearchRecord = @"K_SearchRecord";
/**
 *  存储环信相关的KEY
 */
static NSString * const KEaseNickAndPhoto = @"K_EaseNickAndPhoto";


static NSString * const KCommentBadge = @"K_CommentBadge";

static NSString * const KClubID = @"K_ClubID";

@interface VPStorageManager ()

@end


@implementation VPStorageManager

+ (void)saveLoginInfo:(NSDictionary *)loginInfo{
    [[QMStorageManage sharedManager].commonDB setObject:loginInfo forKey:KLoginInfo];
}

+ (NSDictionary *)loadLoginInfo{
    return [[QMStorageManage sharedManager].commonDB objectForKey:KLoginInfo];
}

+ (void)deleteLoginInfo{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KLoginInfo];
}

+ (void)saveUserInfo:(UserInfoModel *)userInfoModel{
    /*
     "sysUserId": 1,
     "sysUserName": "admin"
     */
    id userDict =[userInfoModel yy_modelToJSONObject];
        [[QMStorageManage sharedManager].commonDB setObject:userDict forKey:KUserInfo];
        //    [[QMStorageManage sharedManager] loadUserDB:userInfoModel.userName];
        NSLog(@"%@",[QMStorageManage sharedManager].userDB);
}

+ (UserInfoModel *)loadUserInfo{
    id userDict = [[QMStorageManage sharedManager].commonDB objectForKey:KUserInfo];
    if(userDict){
        UserInfoModel * userInfoModel = [UserInfoModel yy_modelWithDictionary:userDict];
//        [[QMStorageManage sharedManager] loadUserDB:userInfoModel.userName];
        return userInfoModel;
    }
    return nil;
}

+ (void)deleteUserInfo{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KUserInfo];
    //清理用户的数据库
    [[QMStorageManage sharedManager] cleanUserDB];
}

+ (void)saveClubId:(NSString *)clubId{

    [[QMStorageManage sharedManager].commonDB setObject:clubId forKey:KClubID];
}

+ (NSString *)loadClubId{

    NSString * clubId =[[QMStorageManage sharedManager].commonDB objectForKey:KClubID];
    return clubId;
}

+ (void)deleteClubId{

    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KClubID];
}

+ (void)saveSearchRecord:(NSString *)searchRecord{
    NSMutableArray *array = [NSMutableArray arrayWithArray:[[QMStorageManage sharedManager].commonDB objectForKey:KSearchRecord]];
    [array addObject:searchRecord];
    [[QMStorageManage sharedManager].commonDB setObject:array forKey:KSearchRecord];
}

+ (NSArray *)loadSearchRecord{
    NSMutableArray *searchRecord = [[QMStorageManage sharedManager].commonDB objectForKey:KSearchRecord];
    return searchRecord;
}

+ (void)deleteSearchRecord{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KSearchRecord];
}

+ (void)saveEaseNickAndPhoto:(NSDictionary *)easeInfo{
    [[QMStorageManage sharedManager].commonDB setObject:easeInfo forKey:KEaseNickAndPhoto];
}

+ (NSDictionary *)loadEaseNickAndPhoto{
    NSDictionary *dict = [[QMStorageManage sharedManager].commonDB objectForKey:KEaseNickAndPhoto];
    return dict;
}

+ (void)deleteEaseNickAndPhoto{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KEaseNickAndPhoto];
}

+ (void)saveCommentBadgeCount:(NSInteger)count{
    NSInteger oldCount = [[[QMStorageManage sharedManager].userDB objectForKey:KCommentBadge] integerValue];
    count = count + oldCount;
    [[QMStorageManage sharedManager].userDB setObject:@(count) forKey:KCommentBadge];
}

+ (NSInteger)loadCommentBadgeCount{
    NSNumber *count = [[QMStorageManage sharedManager].userDB objectForKey:KCommentBadge];
    return [count integerValue];
}

+ (void)deleteCommentBadgeCount{
    [[QMStorageManage sharedManager].userDB removeObjectForKey:KCommentBadge];
}


@end
