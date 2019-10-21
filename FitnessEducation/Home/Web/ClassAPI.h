//
//  ClassAPI.h
//  ChinaMerchants
//
//  Created by yishuhong on 2017/9/4.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "XXAPI.h"

@interface ClassAPI : XXAPI

/**
 班级列表
 
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClassListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级列表发布作业（班级作业最高积分限定获）
 
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClassHighestpointslimitParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员列表
 
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClassStudentListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员考勤
 
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)StudentClockingParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员考勤状态清空
 
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)StudentClearClockingParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员考勤集体
 
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)StudentEntiretyClockingParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员考勤状态清空
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
-(void)clearAttendanceParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 发布作业

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)PulishWorkParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 编辑作业

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)EditPulishWorkParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 删除作业
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)DetelePulishWorkParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员详情信息
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)StudentInformationParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;
/**
 班级学员成长记录列表
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)StudentGrowthRecordParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;


/**
 
 添加成长记录列表
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)AddGrowthRecordParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;
/**
 
 查看成长记录列表
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)LookGrowthRecordParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员成长记录详情
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)StudentGrowthRecordDetailParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员作业列表
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)AssignmentListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 班级学员作业打分
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)AssignmentGradeParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
  班级学员作业详情
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)AssignmentDetailParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 学员作业填写
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)SubitAssignmentParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 发布工作总结
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)SummedUpPulishParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

@end
