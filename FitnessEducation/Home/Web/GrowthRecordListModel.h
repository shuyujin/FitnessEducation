//
//  GrowthRecordListModel.h
//  ChinaMerchants
//
//  Created by yishuhong on 2017/9/5.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GrowthRecordListModel : NSObject

/**
 记录id
 */
@property (strong, nonatomic) NSString * growthRecordId;

/**
 班级成员id
 */
@property (strong, nonatomic) NSString * groupMemberId;

/**
 班级成员id
 */
@property (strong, nonatomic) NSString * clubGroupId;

/**
 记录编号
 */
@property (strong, nonatomic) NSString * growthRecordNo;

/**
 标题
 */
@property (strong, nonatomic) NSString * title;

/**
 教练填写状态 0未填写 1完成 2 未完成
 */
@property (strong, nonatomic) NSString * coachStatus;

/**
 家长填写状态 0未填写 1完成 2 未完成
 */
@property (strong, nonatomic) NSString * parentStatus;

/**
 1正常可填 0不可填写
 */
@property (strong, nonatomic) NSString * status;

/**
 教练更新记录时间
 */
@property (strong, nonatomic) NSString * coachUpdateTime;

/**
 家长更新记录时间
 */
@property (strong, nonatomic) NSString * parentUpdateTime;

/**
 创建时间
 */
@property (strong, nonatomic) NSString * createdTime;

@property (strong, nonatomic) NSString * userName;

@end
