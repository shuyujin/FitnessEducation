//
//  InfoPlist.m
//  VillagePlay
//
//  Created by Apricot on 16/6/21.
//  Copyright © 2016年 zjh. All rights reserved.
//

#import "InfoPlist.h"
#import <UIKit/UIKit.h>

@implementation InfoPlist
+ (NSString *) mainVersion
{
    return  [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}
+ (NSString *) buildVersion
{
    return  [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
}
+ (NSString *)buildID{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
}
+ (NSString *)appName {
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
}
+ (NSInteger) dbVersion
{
    NSNumber *ver = [[NSBundle mainBundle] infoDictionary][@"DatabaseVersion"];
    if(ver)
        return [ver integerValue];
    return -1;
}

+(NSString *)deviceID{

    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

@end
