//
//  QMShareUIManager.h
//  VillagePlay
//
//  Created by Apricot on 16/11/7.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMShareMenuSelectionView.h"


@interface QMShareUIManager : NSObject

+ (void)showShareMenuViewInWindowWithPlatformSelectionBlock:(QMSharePlatformSelectionBlock)block;

@end
