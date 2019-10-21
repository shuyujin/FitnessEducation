//
//  LSDSessionManager.h
//
//  Created by  on 2018/4/9.
//  Copyright © 2018年 syyp. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface LSDSessionManager : AFHTTPSessionManager

+ (instancetype)shareManager;

@end
