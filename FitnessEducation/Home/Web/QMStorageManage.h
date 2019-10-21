//
//  QMStorageManage.h
//  HotelBusiness
//
//  Created by Apricot on 16/9/1.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Objective-LevelDB/LevelDB.h>
@interface QMStorageManage : NSObject
/**
 *  系统级别的DB
 */
@property (nonatomic, strong) LevelDB *commonDB;

/**
 *  用户级别的DB （需要先调用loadUserDB:(NSString *)userName 实例化userDB)
 */
@property (nonatomic, strong) LevelDB *userDB;

+ (instancetype)sharedManager;

/**
 *  实例化用户DB
 *
 *  @param userName 用户的标识
 */
- (void)loadUserDB:(NSString *)userName;

/**
 只关闭不清理用户DB
 */
- (void)closeUserDB;

/**
 *  关闭并清理用户DB
 */
- (void)cleanUserDB;

/**
 *  清理所有DB
 */
- (void)cleanDB;

/**
 *  获取DB的版本
 *
 *  @return 返回DB的版本号
 */
- (NSInteger)dbVersion;

/**
 *  设置DB的版本
 *
 *  @param dbVersion DB版本号
 */
- (void)setDbVersion:(NSInteger)dbVersion;
/**
 *  检查DB的版本
 */
- (void)checkDbVersion;
@end
