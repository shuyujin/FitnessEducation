//
//  QMShareUIManager.m
//  VillagePlay
//
//  Created by Apricot on 16/11/7.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "QMShareUIManager.h"

@interface QMShareUIManager ()
@property (nonatomic, strong) QMShareMenuSelectionView *selectionView;
@end

@implementation QMShareUIManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static id _shared;
    dispatch_once(&onceToken, ^{
        _shared = [[[self class] alloc] init];
    });
    return _shared;
}

+(void)showShareMenuViewInWindowWithPlatformSelectionBlock:(QMSharePlatformSelectionBlock)block{
    QMShareUIManager *shareUIManager = [QMShareUIManager sharedManager];
    shareUIManager.selectionView = [[QMShareMenuSelectionView alloc] init];
    shareUIManager.selectionView.shareSelectionBlock = ^(UMSocialPlatformType platformType){
        if (block) {
            block(platformType);
        }
    };
    [shareUIManager.selectionView showShareMenuView];
}

@end
