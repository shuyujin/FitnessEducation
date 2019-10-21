//
//  UIButton+Activity.m
//  IOS_JJD
//
//  Created by Apricot on 2017/6/9.
//  Copyright © 2017年 HNTH. All rights reserved.
//

#import "UIButton+Activity.h"
#import <objc/runtime.h>

#define K_Activity "K_Activity"


@implementation UIButton (Activity)
- (void)setActivity:(NSString *)activity{
    objc_setAssociatedObject(self, K_Activity, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)activity{
    return objc_getAssociatedObject(self, K_Activity);
}

@end
