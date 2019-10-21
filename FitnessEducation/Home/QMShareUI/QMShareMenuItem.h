//
//  QMShareMenuItem.h
//  VillagePlay
//
//  Created by Apricot on 16/11/7.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

#define cellIdentifier @"QMShareMenuItem"

#define cellWidth @65

@interface QMShareMenuItem : UICollectionViewCell

@property (strong, nonatomic) UIImageView *logoImageView;

@property (strong, nonatomic) UILabel *platformNameLabel;

- (void)reloadDataWithImage:(UIImage *)image platformName:(NSString *)platformName;

@end
