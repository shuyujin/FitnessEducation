//
//  QMShareMenuSelectionView.m
//  VillagePlay
//
//  Created by Apricot on 16/11/7.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "QMShareMenuSelectionView.h"
#import "QMShareMenuItem.h"

#define ShareViewHeight 204
#define ShareViewColor [UIColor colorWithRed:0.9098 green:0.9137 blue:0.9098 alpha:1.0]



@interface QMShareMenuSelectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UIView *backgroundGrayView;

@property (nonatomic, strong) UIView *shareView;

/**
 *  取消按钮
 */
@property (nonatomic, strong) UIButton *cancelButton;


@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *shareItems;


@end


@implementation QMShareMenuSelectionView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.shareItems = [NSMutableArray array];
        
        NSArray *platformTypeArray = @[
                                       @(UMSocialPlatformType_WechatSession),
                                       @(UMSocialPlatformType_WechatTimeLine),
                                       @(UMSocialPlatformType_QQ),
                                       @(UMSocialPlatformType_Qzone),
                                       @(UMSocialPlatformType_Sina),
                                       ];
        for (NSNumber *platformType in [UMSocialManager defaultManager].platformTypeArray) {

//        for (NSNumber *platformType in platformTypeArray) {
            NSDictionary *dict = [self dictWithPlatformName:platformType];
            if([[dict allKeys] containsObject:@"platformName"]){
                NSString *platformName = dict[@"platformName"];
                if(platformName.length >1){
                    [self.shareItems addObject:dict];
                }
            }
        }
        
        [self creatBackgroundGrayView];
        [self createShareView];
        [self creatLabel];
        [self creatCancelButton];
        [self creatContentView];
    }
    return self;
}

- (NSMutableDictionary *)dictWithPlatformName:(NSNumber *)platformType{
    UMSocialPlatformType platformType_int = [platformType integerValue];
    NSString *imageName = nil;
    NSString *platformName = nil;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:1];
    switch (platformType_int) {
        case UMSocialPlatformType_QQ:{
            //qq的图标
            imageName = @"vp_btn_share_qq";
            platformName = @"QQ好友";
        }break;
        case UMSocialPlatformType_WechatSession:{
            imageName = @"vp_btn_share_wechat";
            platformName = @"微信好友";
        }break;
        case UMSocialPlatformType_WechatTimeLine:{
            imageName = @"vp_btn_share_circle";
            platformName = @"朋友圈";
        }break;
        case UMSocialPlatformType_Sina:{
            imageName = @"vp_btn_share_sina";
            platformName = @"新浪微博";
        }break;
        case UMSocialPlatformType_Qzone:{
            imageName = @"vp_btn_share_space";
            platformName = @"QQ空间";
        }break;
        default:
            break;
    }
    dict[@"imageName"] = imageName;
    dict[@"platformName"] = platformName;
    dict[@"UMSocialPlatformType"] = @(platformType_int);
    return dict;
}

//创建半透明背景视图
- (void)creatBackgroundGrayView{
    self.backgroundGrayView = [[UIView alloc] initWithFrame:self.bounds];
    self.backgroundGrayView.backgroundColor = [UIColor blackColor];
    self.backgroundGrayView.alpha = 0.3;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenShareMenuView)];
    [self.backgroundGrayView addGestureRecognizer:tap];
    [self addSubview:self.backgroundGrayView];
}

- (void)createShareView{
    self.shareView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-204, CGRectGetWidth(self.frame), 204)];
    self.shareView.backgroundColor = ShareViewColor;
    [self addSubview:self.shareView];
}

//创建取消按钮
- (void)creatCancelButton{
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(0, CGRectGetHeight(self.shareView.frame)-46, CGRectGetWidth(self.shareView.frame), 46);
    [cancelButton addTarget:self action:@selector(hiddenShareMenuView) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"取 消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithRed:0.1961 green:0.1961 blue:0.1961 alpha:1.0] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor whiteColor];
    self.cancelButton = cancelButton;
    [self.shareView  addSubview:self.cancelButton];
}

- (void)creatContentView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.cancelButton.frame)-108, CGRectGetWidth(self.shareView.frame), 108)
                                             collectionViewLayout:layout];
    
    [self.collectionView registerClass:[QMShareMenuItem class] forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.9098 green:0.9137 blue:0.9098 alpha:1.0];
    [self.shareView addSubview:self.collectionView];
}

- (void)creatLabel{
    UILabel *lb_share = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.shareView.frame), 50)];
    lb_share.text = @"分享";
    lb_share.font = [UIFont systemFontOfSize:12];
    lb_share.textAlignment = NSTextAlignmentCenter;
    lb_share.textColor = [UIColor colorWithRed:0.6196 green:0.6196 blue:0.6196 alpha:1.0];
    [self.shareView addSubview:lb_share];
}

- (void)creatTMShareContentView{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
//    layout.minimumInteritemSpacing = (CGRectGetWidth(self.shareView.frame)-60*[self.shareItems count])/6.0;
//    layout.minimumLineSpacing = layout.minimumInteritemSpacing;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame)-200, CGRectGetWidth(self.frame), 200)
                                             collectionViewLayout:layout];
    [self.collectionView registerClass:[QMShareMenuItem class] forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.9098 green:0.9137 blue:0.9098 alpha:1.0];
    [self addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDelegate&&DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.shareItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QMShareMenuItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary *cellInfo = [self.shareItems objectAtIndex:indexPath.row];
    [cell reloadDataWithImage:[UIImage imageNamed:cellInfo[@"imageName"]] platformName:cellInfo[@"platformName"]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    CGFloat space = (CGRectGetWidth(self.shareView.frame)-60*[self.shareItems count])/([self.shareItems count]+1)-0.2;
    return UIEdgeInsetsMake(5, space, 0, space);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    CGFloat space = (CGRectGetWidth(self.shareView.frame)-60*[self.shareItems count])/([self.shareItems count]+1)-0.2;
    return space;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *cellInfo = [self.shareItems objectAtIndex:indexPath.row];
    self.shareSelectionBlock([cellInfo[@"UMSocialPlatformType"] integerValue]);
    [self hiddenShareMenuView];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(60,86);
}

/**
 *  重新布局界面
 */
- (void)resetSelfFrame{
    
}

- (void)showShareMenuView{
    //上移
    
}

- (void)hiddenShareMenuView{
    //取消
    //下移
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
