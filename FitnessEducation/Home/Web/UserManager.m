//
//  VPUserManager.m
//  VillagePlay
//
//  Created by Apricot on 16/10/18.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UserManager.h"
#import "UserInfoModel.h"
#import "StorageManager.h"
#import "JPUSHService.h"

@interface UserManager ()

/**
 *  用户Model
 */
@property (nonatomic, strong) UserInfoModel *userInfoModel;

@end

@implementation UserManager


+(instancetype)sharedInstance{
    
    static id sharedInstance =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance =[[self alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInfoModel = [VPStorageManager loadUserInfo];
        if(self.userInfoModel){
            [self xx_saveUserInfo:self.userInfoModel];
        }
    }
    return self;
}

- (void)xx_saveLoginInfo:(NSDictionary *)loginInfo{
    [VPStorageManager saveLoginInfo:loginInfo];
}

- (void)xx_saveLoginInfoWithUserName:(NSString *)userName pwd:(NSString *)pwd{
    NSMutableDictionary *loginInfo = [NSMutableDictionary dictionary];
    loginInfo[k_loginUserName] = userName;
    loginInfo[k_loginPwd] = pwd;

    [VPStorageManager saveLoginInfo:loginInfo];
}

- (NSDictionary *)xx_loginInfo{
    return [VPStorageManager loadLoginInfo];
}

- (void)xx_deleteLoginInfo{
    [VPStorageManager deleteLoginInfo];
}


- (void)xx_saveUserInfo:(UserInfoModel *)userInfo{

    self.userInfoModel = userInfo;
    [VPStorageManager saveUserInfo:self.userInfoModel];
    ClubUserModel * clubModel =self.userInfoModel.clubUser;
    if (clubModel) {
        [self xx_saveClubId:clubModel.clubId];
    }
}


- (UserInfoModel *)xx_userInfo{
    return self.userInfoModel;
}

- (void)xx_deleteUserInfo{
    
    //删除用户
    self.userInfoModel =nil;
    
//    NSMutableDictionary * loginInfo = [[[UserManager sharedInstance] xx_loginInfo] mutableCopy];
//    loginInfo[k_loginPwd] = @"";
//    [[UserManager sharedInstance] xx_deleteUserInfo];
    
    //清理登录的账号信息
    [VPStorageManager deleteLoginInfo];
    //清理用户的详情信息
    [VPStorageManager deleteUserInfo];
    [VPStorageManager deleteClubId];
    [VPStorageManager deleteEaseNickAndPhoto];
    //登出的时候需要清理Badge
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UPDATE_BADGENOTIFICATION object:nil];
}

- (void)xx_updateUserInfo:(UserInfoModel *)userInfo{
    
    self.userInfoModel =(UserInfoModel *)userInfo;
    
    [VPStorageManager saveUserInfo:self.userInfoModel];

}

-(NSString *)xx_userinfoID{
    return self.userInfoModel.uId;
}

-(void)xx_saveClubId:(NSString *)clubId{

    [VPStorageManager saveClubId:clubId];
}

-(void)xx_deleteClubId{

    [VPStorageManager deleteClubId];
}

-(NSString *)xx_clubId{

   return [VPStorageManager loadClubId];
}

@end
