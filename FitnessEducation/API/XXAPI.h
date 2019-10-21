//
//  XXAPI.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/2.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)(NSDictionary *responseDict);
typedef void(^Failure)(NSError *error);

@interface XXAPI : NSObject

-(void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

@end
