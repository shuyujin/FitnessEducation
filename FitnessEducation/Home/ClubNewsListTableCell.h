//
//  ClubNewsListTableCell.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/8.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClubInformationModel;
@interface ClubNewsListTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;

-(void)xx_configCellWithEntity:(ClubInformationModel *)entity;

@end
