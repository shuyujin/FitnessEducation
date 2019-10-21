//
//  LSDSessionManager.m
//
//  Created by on 2018/4/9.
//  Copyright © 2018年 syyp. All rights reserved.
//

#import "LSDSessionManager.h"

@implementation LSDSessionManager

static LSDSessionManager *LSDmanager = nil;

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        LSDmanager = [[self alloc] init];
    });
    return LSDmanager;
}

@end
