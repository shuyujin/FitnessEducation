//
//  ClubUserModel.m
//  ChinaMerchants
//
//  Created by JK on 2017/8/17.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "ClubUserModel.h"

@implementation ClubUserModel

-(NSString *)vipLevel{

    switch ([self.vip integerValue]) {
        case 1:
            return @"vip1";
            break;
        case 2:
            return @"vip2";
            break;
        case 3:
            return @"vip3";
            break;
        case 4:
            return @"vip4";
            break;
        case 5:
            return @"vip5";
            break;
        case 6:
            return @"vip6";
            break;
        case 7:
            return @"vip7";
            break;
        case 8:
            return @"vip8";
            break;
        case 9:
            return @"vip9";
            break;
        case 10:
            return @"vip10";
            break;
        case 11:
            return @"vip11";
            break;
        case 12:
            return @"vip12";
            break;
        case 13:
            return @"vip13";
            break;
        case 14:
            return @"vip14";
            break;
        case 15:
            return @"vip15";
            break;
        case 16:
            return @"vip16";
            break;
        case 17:
            return @"vip17";
            break;
        case 18:
            return @"vip18";
            break;
        case 19:
            return @"vip19";
            break;
        case 20:
            return @"vip20";
            break;
        default:
            break;
    }
    return @"";
}

@end
