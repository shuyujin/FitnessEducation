//
//  UIScrollView+Refresh.h
//  VillagePlay
//
//  Created by Apricot on 16/10/19.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

/**
 *  添加Header的事件
 *
 *  @param block 回调的Block
 */
- (void)xx_addHeaderRefreshWithBlock:(dispatch_block_t)block;

/**
 *  添加Footer的事件
 *
 *  @param block 回调的Block
 */
- (void)xx_addFooterRefreshWithBlock:(dispatch_block_t)block;

/**
 *  开始刷新
 */
- (void)xx_beginRefreshing;

/**
 *  刷新底部
 */
- (void)xx_beginFootRefreshing;

/**
 *  结束刷新
 */
- (void)xx_endRefreshing;

/**
 *  是否有更多的数据
 *
 *  @param more YES 有 NO 无
 */
- (void)xx_isHasMoreData:(BOOL)more;



/**
 *  移除head
 */
- (void)xx_removeHeaderRefreshing;

///**
// *  设置bouces颜色
// */
//-(void)setbouncesCorlor:(UIColor*)color;

@end
