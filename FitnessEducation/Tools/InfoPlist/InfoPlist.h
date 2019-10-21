//
//  InfoPlist.h
//  VillagePlay
//
//  Created by Apricot on 16/6/21.
//  Copyright © 2016年 zjh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoPlist : NSObject

/**
 *  获取Version (如：1.0.0，用于给用户查看的)
 *
 *  @return Version
 */
+ (NSString *)mainVersion;

/**
 *  获取Build Version（如1，1.0，1.0.0,用于内部使用的）
 *
 *  @return Build Version
 */
+ (NSString *)buildVersion;


/**
 获取项目的BuildID

 @return 返回当前的BuildId
 */
+ (NSString *)buildID;

/**
 *  获取App名
 *
 *  @return App名
 */
+ (NSString *)appName;
/**
 *  获取DB版本号
 *
 *  @return DB版本号
 */
+ (NSInteger)dbVersion;

/**
 设备id

 @return 返回当前设备
 */
+ (NSString *)deviceID;

@end
