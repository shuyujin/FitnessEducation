//
//  UserInfoModel.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/1.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "BaseModel.h"
#import "ClubUserModel.h"

@interface UserInfoModel : BaseModel

/**
 用户id
 */
@property (strong, nonatomic) NSString * uId;

/**
 俱乐部id
 */
//@property (strong, nonatomic) NSString * clubId;

/**
 用户俱乐部身份
 */
@property (strong, nonatomic) ClubUserModel *clubUser;

@end
