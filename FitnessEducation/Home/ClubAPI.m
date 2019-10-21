//
//  ClubAPI.m
//  ChinaMerchants
//
//  Created by JK on 2017/8/17.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "ClubAPI.h"

@implementation ClubAPI

-(void)ClubBannerParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/home/advert/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)UesrEnterclubParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"user/enterclub" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubeDetailParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/info" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubCoachListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/coach/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)getDefaultclubParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/defaultclub" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubVideListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/video/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubSynopsisDetailsParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    [self POST:@"club/video/info" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubInformationParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"news/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ActivitylistParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"activity/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)ClubActivitylistParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{

    [self POST:@"club/activity/list" parameters:parameters success:^(NSDictionary *responseDict) {
        success(responseDict[@"data"]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
