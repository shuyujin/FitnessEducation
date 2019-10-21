//
//  QMCalendarFunction.m
//  HotelBusiness
//
//  Created by Apricot on 16/8/9.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "QMCalendarFunction.h"

@interface QMCalendarFunction ()
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDateComponents *nowDateComponents;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;

@end

@implementation QMCalendarFunction
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.calendar = [NSCalendar currentCalendar];
    }
    return self;
}

-(NSString *)timeSp:(NSString *)timeSp format:(NSString *)format{

    
    NSTimeInterval time=[timeSp doubleValue]/1000.0;
    
    NSDate*date=[NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSString *timeString =[formatter stringFromDate:date];
    return timeString;
}

- (NSString *)updateTimeForRow:(NSString *)row {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSTimeInterval time=[row doubleValue]/1000.0;
    NSDate*createDate=[NSDate dateWithTimeIntervalSince1970:time];
    
    // 当前时间
    NSDate *now = [NSDate date];
    // 日历对象 （方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit 枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitWeekOfMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:now options:0];
    
    // 获得某个时间的年月日时分秒
    NSDateComponents *createDateCmps = [calendar components:unit fromDate:createDate];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:now];
    
    if (createDateCmps.year == nowCmps.year) { // 今年
        if (cmps.day == 1) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if (cmps.day == 0){ // 今天
            if (cmps.hour > 1) { // 大于1小时前
                return [NSString stringWithFormat:@"%ld小时前", (long)cmps.hour];
            }
            else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前", (long)cmps.minute];
            }
            else {
                return @"刚刚";
            }
        }
        else { // 今年的其他日子
            fmt.dateFormat = @"yyyy-MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    }
    else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return [fmt stringFromDate:createDate];
    }
}


-(NSString *)nowYearMoney:(NSString *)format{
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format];
    NSString *yearString = [formatter stringFromDate:date];
    return yearString;
}

- (void)nowDate{
    if(!self.nowDateComponents){
        NSDate *firstDay = [NSDate date];
        self.nowDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:firstDay];
//        self.year = dateComponents.year;
//        self.month = dateComponents.month;
//        self.day = dateComponents.day;
    }
}

- (NSDate *)futureYear:(NSInteger)yearTime{
    NSDate *futureDate = nil;
    if(!self.nowDateComponents){
        [self nowDate];
    }
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = self.nowDateComponents.year+yearTime;
    dayComponents.month = self.nowDateComponents.month;
    dayComponents.day = self.nowDateComponents.day;
    futureDate = [self.calendar dateFromComponents:dayComponents];
    return futureDate;
}

- (NSDate *)futureMonth:(NSInteger)monthTime{
    NSDate *futureDate = nil;
    if(!self.nowDateComponents){
        [self nowDate];
    }
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = self.nowDateComponents.year;
    dayComponents.month = self.nowDateComponents.month+monthTime;
    dayComponents.day = self.nowDateComponents.day;
    futureDate = [self.calendar dateFromComponents:dayComponents];
    return futureDate;
}

- (NSDate *)transformDateWithYear:(NSInteger)year withMonth:(NSInteger)month{
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = year;
    dayComponents.month = month;
    dayComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:dayComponents];
    return date;
}

-(NSArray *)nowBeginToEndInEndDate:(NSDate *)enddate{
    return [self beginTime:[NSDate date] endTime:enddate];
}

-(NSArray *)beginTime:(NSDate *)beginDate endTime:(NSDate *)endDate{
    NSMutableArray *dateArray = [NSMutableArray array];
    NSDateComponents *beginDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:beginDate];
    NSDateComponents *endDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:endDate];
    //年
    NSInteger beginYear = beginDateComponents.year;
    NSInteger endYear  = endDateComponents.year;
    
    for (NSInteger year = beginYear; year <= endYear; year++) {
        NSInteger beginMonth = 1;
        NSInteger endMonth = 12;

        if (year == beginYear) {
            beginMonth = beginDateComponents.month;
        }
        if (year == endYear){
            endMonth = endDateComponents.month;
        }
        for (NSInteger month = beginMonth; month <= endMonth; month++) {
            NSMutableDictionary *monthDict = [NSMutableDictionary dictionary];
            monthDict[@"year"] = @(year);
            monthDict[@"month"] = @(month);
            NSArray *array = [self dayArrayWithYear:year withMonth:month];
            monthDict[@"days"] = array;
            [dateArray addObject:monthDict];
        }
    }
    return dateArray;
}

- (NSArray *)yearAndMonthWithDate:(NSDate *)endDate{
    NSDate *beginDate = [NSDate date];
    NSDateComponents *beginDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:beginDate];
    NSDateComponents *endDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:endDate];
    //年
    NSInteger beginYear = beginDateComponents.year;
    NSInteger endYear  = endDateComponents.year;
    
    NSMutableArray *dateArray = [NSMutableArray array];
    
    for (NSInteger year = beginYear; year <= endYear; year++) {
        NSMutableDictionary *yearDict = [NSMutableDictionary dictionary];
        yearDict[@"year"] = @(year);
        NSInteger beginMonth = 1;
        NSInteger endMonth = 12;
        
        if (year == beginYear) {
            beginMonth = beginDateComponents.month;
        }
//        if (year == endYear){
//            endMonth = endDateComponents.month;
//        }
        NSMutableArray * monthArray = [NSMutableArray array];
        for (NSInteger month = beginMonth; month <= endMonth; month++) {
            [monthArray addObject:@(month)];
        }
        yearDict[@"month"] = monthArray;
        [dateArray addObject:yearDict];
    }
    return dateArray;
}

- (NSArray *)dayArrayWithYear:(NSInteger)year withMonth:(NSInteger)month{
    //获取指定月年份的数据
    NSMutableArray *array = [NSMutableArray array];
    
    self.calendar.firstWeekday = 1;
    self.calendar.minimumDaysInFirstWeek = 1;
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = year;
    dayComponents.month = month;
    dayComponents.day = 1;
    
    NSDate *firstDay = [self.calendar dateFromComponents:dayComponents];
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:firstDay];
    
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDay];
    NSInteger frontBlankCount = dateComponents.weekday - self.calendar.firstWeekday;
    if(frontBlankCount < 0){
        frontBlankCount +=7;
    }
    //空白
    for (int i = 0; i<frontBlankCount; i++) {
        [array addObject:@""];
    }
    for (int i = 0; i<range.length; i++) {
        NSString *day = [NSString stringWithFormat:@"%d",i+1];
        [array addObject:day];
    }
    return array;
}

- (NSArray *)year:(NSInteger)year withMonth:(NSInteger)month{

    //获取指定月年份的数据
    NSMutableArray *array = [NSMutableArray array];
    
    self.calendar.firstWeekday = 1;
    self.calendar.minimumDaysInFirstWeek = 1;
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = year;
    dayComponents.month = month;
    dayComponents.day = 1;
    
    NSDate *firstDay = [self.calendar dateFromComponents:dayComponents];
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:firstDay];
    
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDay];
    NSInteger frontBlankCount = dateComponents.weekday - self.calendar.firstWeekday;
    if(frontBlankCount < 0){
        frontBlankCount +=7;
    }
//    //空白
//    for (int i = 0; i<frontBlankCount; i++) {
//        [array addObject:@""];
//    }
    for (int i = 0; i<range.length; i++) {
        NSString *day = [NSString stringWithFormat:@"%d",i+1];
        [array addObject:day];
    }
    return array;
}

- (NSInteger)getWeekWithDayArray:(NSArray *)dayArray{
    //获取指定数据模型里有多少个周
    NSInteger weeks = dayArray.count/7;
    NSInteger days = dayArray.count %7;
    if(days >0){
        weeks++;
    }
    return weeks;
}

/**
 *  获取一天的时间
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)getDayTime{

    NSMutableArray * timeArray =[[NSMutableArray alloc]init];
    for (int i=1; i<=24; i++) {
        NSString *timeString =[NSString stringWithFormat:@"%d:00",i];
        [timeArray addObject:timeString];
    }
    return timeArray;
}

@end
