//
//  ClassAPI.m
//  ChinaMerchants
//
//  Created by yishuhong on 2017/9/4.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "ClassAPI.h"
#import "UserInfoModel.h"
#import "UserManager.h"

@implementation ClassAPI

-(void)ClassListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/coach/group/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClassHighestpointslimitParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    [self POST:@"club/group/task/highestpointslimit/get" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClassStudentListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/coach/group/member/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)StudentClockingParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/coach/group/attendance/check" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)StudentClearClockingParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/coach/group/attendance/clear" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)StudentEntiretyClockingParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/coach/group/attendance/allCheck" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)clearAttendanceParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    [self POST:@"club/coach/group/attendance/clear" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)PulishWorkParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/group/task/add" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)EditPulishWorkParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    [self POST:@"club/group/task/edit" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];

}

-(void)DetelePulishWorkParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    [self POST:@"club/group/task/delete" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)StudentInformationParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"user/info" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)StudentGrowthRecordParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
    ClubUserModel *clubUser =userInfoModel.clubUser;
    //学生端
    NSString * urlString =@"";
    if ([clubUser.role isEqualToString:@"1"]) {
        urlString=@"club/user/growthrecord/list";
    }
    if ([clubUser.role isEqualToString:@"2"]||[clubUser.role isEqualToString:@"3"]) {
       //老师端
        urlString =@"club/group/member/growthrecord/list";
    }
    [self POST:urlString parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)AddGrowthRecordParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
    ClubUserModel *clubUser =userInfoModel.clubUser;
    //学生端
    NSString * urlString =@"";
    if ([clubUser.role isEqualToString:@"1"]) {
        urlString=@"club/group/member/growthrecord/fill";
    }
    if ([clubUser.role isEqualToString:@"2"]||[clubUser.role isEqualToString:@"3"]) {
        //老师端
        urlString =@"club/group/member/growthrecord/fill";
    }
    [self POST:urlString parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)LookGrowthRecordParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/group/member/growthrecord/info" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)StudentGrowthRecordDetailParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/group/member/growthrecord/info" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)AssignmentListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
    ClubUserModel *clubUser =userInfoModel.clubUser;
    //学生端
    NSString * urlString =@"";
    if ([clubUser.role isEqualToString:@"1"]) {
        urlString=@"club/user/task/list";
    }
    if ([clubUser.role isEqualToString:@"2"]||[clubUser.role isEqualToString:@"3"]) {
        //老师端
        urlString =@"club/group/member/task/list";
    }
    [self POST:urlString parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)AssignmentGradeParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/group/task/score" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)AssignmentDetailParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/group/member/task/info" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)SubitAssignmentParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/user/task/fill" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)SummedUpPulishParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    [self POST:@"club/user/coursesummary/add" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
