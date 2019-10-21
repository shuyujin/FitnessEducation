//
//  UIColor+HUE.m
//  HotelBusiness
//
//  Created by  JK on 16/7/21.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UIColor+HUE.h"
#import "UIColor+HEX.h"

@implementation UIColor (HUE)

+ (UIColor *)navigationBarTintColor{
    return [UIColor whiteColor];
}

+ (UIColor *)navigationTintColor{
//    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"MainColor"]];
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"gongzuo_beijing"]];
//    return [UIColor colorWithRed:78.0f/255.0f green:181.0f/225.0f blue:131.0f/225.0f alpha:1.0f];
}

+ (UIColor *)navigationTitleColor{
    return [self colorWithRed:11.00f/255.00f green:30.00f/255.00f blue:48.00f/255.00f alpha:1.0f];
}

+ (UIColor *)navigationBottonLineView{
    return  [UIColor colorWithRed:177.0/255.0 green:177.0/255.0 blue:177.0/255.0 alpha:1.0];
}

+ (UIColor *)tabBarTintColor{
    return [UIColor whiteColor];
}

+ (UIColor *)tabTintColor{
    return [self navigationTintColor];
}


+ (UIColor *)septalLineColor{
    return [UIColor colorWithHexString:@"#e5e5e5"];
}

+ (UIColor *)controllerBackgroundColor{
    return [UIColor colorWithHexString:@"#f5f5f5"];
}


+(UIColor *)VPRedColor{

    return [UIColor colorWithRed:242.0f/255.0f green:48.0f/225.0f blue:48.0f/225.0f alpha:1.0f];
}

+(UIColor *)VPMainColor{

    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"mianColor"]];

//    return [UIColor colorWithHexString:@"#3a3c48"];
}

+(UIColor *)VPDetailColor{

    return [UIColor colorWithHexString:@"#999999"];
}

+(UIColor *)VPTitleColor{

    return [UIColor colorWithHexString:@"#000000"];

}

+(UIColor *)VPContentColor{

    return [UIColor colorWithHexString:@"#666666"];
}


+(UIColor *)VPOrderColor{

    return [UIColor colorWithHexString:@"#fd5454"];
}

+(UIColor *)btnColor{
    
    return [UIColor colorWithHexString:@"#f0f0f0"];
}

@end
