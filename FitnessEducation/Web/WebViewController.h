//
//  WebViewController.h
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController

/**
 *  type 1:不用加密   2:需要加密
 */
- (id)initWithWebURL:(NSString *)urlString andType:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
