//
//  CHTypeEnum.h
//  ChinaMerchants
//
//  Created by JK on 2017/7/31.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#ifndef CHTypeEnum_h
#define CHTypeEnum_h


typedef enum : NSUInteger {
    HometrainingSignUpType        =   101 ,//创业培训 正在报名
    HometrainingEndSignUpType     =  102 ,//创业培训 报名结束xiang
    HomeProjectType               =  103 ,//招商项目
    HomeVillageTravelType         =  104 ,//乡村旅游
    HomeTakeOutServiceType        =  105,//外卖服务
    HomeHousekeepingInformationType   =  106,//家政信息
    HomeMediationInformationType      =  107,//中介信息
    HomeDiscountLoanType          =  108,//贴息贷款
    HomeApplianceMaintenanceType  = 109,//家电维修
    HomeHydroelectricInstallType  = 110,//家电维修
    HomeLoansPolicyType           = 111,//贷款政策
    HomeLoansFlowType             = 112,//贷款流程
    HomeDiscountFlowType          = 113,//贴息流程
    HomeInformationBillboardType  = 114,//信息公示
}ArticleType;

typedef enum : NSUInteger {
    loginRegisterType        =   0 ,//注册
    loginForgotPasswordType     =  1 ,//忘记密码
}userInfoType;

typedef enum : NSUInteger {
    VPChannelTypeAPP         =  -1024 ,//注意这个是自己实现的 并非后台的(目前用在APP分享的地方)分享下载地址
    DDChannelTypeDynamicList       =   1,//动态列表
    DDChannelTypeDynamicDetail     =   2 ,//动态详情
} VPChannelType;

//动态发布
typedef enum : NSUInteger {
    ChannelDynamicPulishType                = 0,//动态发布
    ChannelWorkPulishType                   =   1,//布置作业
    ChannelAddVisitorContentPulishType      =2,//添加访客内容
    ChannelEditVisitorContentPulishType     = 3,//编辑访客内容
    ChannelAddWorkDiaryPulishType           = 4,//添加工作日志
    ChannelEditWorkDiaryPulishType          = 5,//编辑工作日志
    ChannelSubitAssignmentType              = 6,//学生端提交作业
    ChannelSummedUpType                     = 7,//发布课程总结
} ChannelPulishType;

//业绩查询
typedef enum : NSUInteger {
    PerformancermemberType                = 0,//业绩查询我的会员
    PerformancerSignClassType             =   1,//业绩查询签课
} PerformancerType;

typedef enum : NSUInteger {
    AssignmentAllType                = 0,//全部
    AssignmentCompleteType           = 1,//已完成
    AssignmentNoCompleteType         = 2,//未完成
    AssignmentProgressType           = 3,//进行中
} AssignmentType;

typedef enum : NSUInteger {
    WebComeFromActivityType          = 0,//活动
    WebComeFromNewsType              = 1,//新闻
    WebComeFromprotocolType          = 2,//协议
    WebComeFromUsMeType              = 3,//关于我们
    WebComeFromshoppingMallType      = 4,//商城
    WebComeFromAddGrowthRecord       = 5,//工作（成长记录）
    WebComeFromLookGrowthRecord      = 6,//学习（成长记录）
} WebComeFromType;

typedef enum : NSUInteger {
    MyFansComeFromType          = 0,//粉丝
    MyAttentionComeFromType     = 1,//关注
} MyFansOrAttentionComeFromType;

typedef enum : NSUInteger {
    AddVisitorType          = 0,//添加访客
    EditVisitorType         = 1,//编辑访客
} VisitorType;

typedef enum : NSUInteger {
    AddTeachingType          = 0,//添加教学计划
    EditTeachingType         = 1,//编辑教学计划
} TeachingType;

#endif /* CHTypeEnum_h */
