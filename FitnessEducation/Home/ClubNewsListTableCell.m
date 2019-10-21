//
//  ClubNewsListTableCell.m
//  ChinaMerchants
//
//  Created by JK on 2017/8/8.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "ClubNewsListTableCell.h"
#import "UIColor+HUE.h"
#import "UIImageView+Load.h"
#import "ClubInformationModel.h"

@implementation ClubNewsListTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textColor =[UIColor VPTitleColor];
    self.detailLabel.textColor =[UIColor VPDetailColor];
}

-(void)xx_configCellWithEntity:(ClubInformationModel *)entity{

    ClubInformationModel * informationModel =entity;
    self.titleLabel.text =informationModel.title;
    self.detailLabel.text =informationModel.introduction;
    [self.newsImageView xx_setImageWithURLStr:informationModel.imgUrl placeholder:[UIImage imageNamed:@"zhengfangxing_800x800"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
