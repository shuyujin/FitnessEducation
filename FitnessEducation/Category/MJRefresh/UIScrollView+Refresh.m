//
//  UIScrollView+Refresh.m
//  VillagePlay
//
//  Created by Apricot on 16/10/19.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import <MJRefresh/MJRefresh.h>
#import <objc/runtime.h>
@implementation UIScrollView (Refresh)

- (void)xx_addHeaderRefreshWithBlock:(dispatch_block_t)block{
    MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if(block){
            block();
        }
    }];
    self.mj_header = header;
}

- (void)xx_addFooterRefreshWithBlock:(dispatch_block_t)block{
    MJRefreshFooter * footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if(block){
            block();
        }
    }];
    footer.automaticallyHidden = YES;
    self.mj_footer = footer;
}

- (void)xx_beginRefreshing{
    [self.mj_header beginRefreshing];
}

- (void)xx_beginFootRefreshing
{
   [self.mj_footer beginRefreshing];
}

- (void)xx_endRefreshing{
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
    } else if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
    }
}

- (void)xx_isHasMoreData:(BOOL)more{
    [self.mj_header endRefreshing];
    if (!more) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.mj_footer endRefreshing];
    }
}

- (void)xx_removeHeaderRefreshing
{
    
    [self.mj_header endRefreshing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.mj_header=nil;
    });
    
}

//-(void)setbouncesCorlor:(UIColor *)color
//{
//    
//    UIView *buncesView=objc_getAssociatedObject(self, @"UIScrollView_BuncesKey");
//    if (buncesView==nil) {
//        
//        buncesView=[[UIView alloc] initWithFrame:CGRectMake(0, -self.height, self.width, self.height)];
//        [self addSubview:buncesView];
//        
//         objc_setAssociatedObject(self, @"UIScrollView_BuncesKey", buncesView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    }
//    
//    buncesView.backgroundColor=color;
//    [self sendSubviewToBack:buncesView];
//}
@end
