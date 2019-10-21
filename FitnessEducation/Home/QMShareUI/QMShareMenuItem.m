//
//  QMShareMenuItem.m
//  VillagePlay
//
//  Created by Apricot on 16/11/7.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "QMShareMenuItem.h"
#import "Masonry.h"

@implementation QMShareMenuItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.logoImageView = [[UIImageView alloc] init];
        self.logoImageView.bounds = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame)-8,CGRectGetWidth(self.contentView.frame)-8);
        [self.contentView addSubview:self.logoImageView];
        
        self.platformNameLabel = [[UILabel alloc] init];
        self.platformNameLabel.textAlignment = NSTextAlignmentCenter;
        self.platformNameLabel.font = [UIFont systemFontOfSize:12];
        self.platformNameLabel.numberOfLines = 2;
        self.platformNameLabel.textColor = [UIColor colorWithRed:0.6196 green:0.6196 blue:0.6196 alpha:1.0];
        self.platformNameLabel.bounds = CGRectMake(0, 0, CGRectGetWidth(self.logoImageView.frame), 30);
        [self.contentView addSubview:self.platformNameLabel];
        
        self.logoImageView.center = CGPointMake(self.contentView.center.x, (CGRectGetHeight(self.contentView.frame)-CGRectGetHeight(self.platformNameLabel.frame))/2.0);
        self.platformNameLabel.center = CGPointMake(self.contentView.center.x,CGRectGetMaxY(self.logoImageView.frame)+(CGRectGetHeight(self.contentView.frame) - CGRectGetMaxY(self.logoImageView.frame))/2.0);
    }
    return self;
}

- (void)reloadDataWithImage:(UIImage *)image platformName:(NSString *)platformName
{
    self.logoImageView.image = image;
    
    self.platformNameLabel.text = platformName;
}


@end
