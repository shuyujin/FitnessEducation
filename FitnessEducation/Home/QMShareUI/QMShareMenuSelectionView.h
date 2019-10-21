//
//  QMShareMenuSelectionView.h
//  VillagePlay
//
//  Created by Apricot on 16/11/7.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UMSocialCore/UMSocialCore.h>



typedef void(^QMSharePlatformSelectionBlock)(UMSocialPlatformType platformType);


@interface QMShareMenuSelectionView : UIView

@property (nonatomic, strong) NSMutableArray *sharePlatformInfoArray;

@property (nonatomic, copy) QMSharePlatformSelectionBlock shareSelectionBlock;


/**
 *  显示分享的菜单栏
 */
- (void)showShareMenuView;

/**
 *  隐藏分享的菜单栏
 */
- (void)hiddenShareMenuView;

@end
