//
//  WebView.h
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebView : UIView

-(instancetype)initWithFrame:(CGRect)frame urlStr:(NSString *)urlStr;

@end

NS_ASSUME_NONNULL_END
