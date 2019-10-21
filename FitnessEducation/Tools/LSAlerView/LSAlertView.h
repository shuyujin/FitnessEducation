//
//  LSAlertView.h
//  WeiLingDi
//
//  Created by wld on 2017/11/24.
//  Copyright © 2017年 syyp. All rights reserved.
//

#import <UIKit/UIKit.h>

//点击按钮回调
typedef void(^AlertResult)(NSInteger index);

@interface LSAlertView : UIView

/** 确认按钮 */
@property(nonatomic,retain) UIButton *sureBtn;
/** 取消按钮 */
@property(nonatomic,retain) UIButton *cancleBtn;
/** 商品管理区分-1 */
@property(nonatomic,assign) NSInteger type;


/**  */
@property(nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancleBtn:(NSString *)cancleTitle sureBtn:(NSString *)sureTitle ;

-(void)show;

-(void)remove;

@end
