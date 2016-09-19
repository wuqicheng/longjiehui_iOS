//
//  NSString+DateFromNow.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "NSString+DateFromNow.h"

@implementation NSString (DateFromNow)

-(NSInteger)dateFromNow{

    static NSDateFormatter *formatter;
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"YYYY-MM-dd"];
    }
    long date = [[formatter dateFromString:self] timeIntervalSince1970];
    long datenow = [[NSDate date] timeIntervalSince1970];
    return (date - datenow) / (60 * 60 * 24);
    
}

-(NSString *)dateString{
    return [self substringToIndex:10];
}

-(NSDate *)dateFromStringFormat:(NSString *)format{
    static NSDateFormatter *formatter;
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
//        [formatter setDateFormat:@"YYYY-MM-dd"];
    }
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

-(NSString *)formatDateStringWithFormatter:(NSString *)formatter{
    static NSDateFormatter *inputFormatter;
    if (!inputFormatter) {
        inputFormatter = [[NSDateFormatter alloc] init];
    }
    [inputFormatter setDateFormat:formatter];
    NSDate *date = [inputFormatter dateFromString:self];
    long miles = [date timeIntervalSince1970];
    long currentMiles = [[NSDate new] timeIntervalSince1970];
    long margin = currentMiles - miles;
    if (margin < 60) {
        return @"刚刚";
    }else if(margin < 60 * 60){
        return [NSString stringWithFormat:@"%ld分钟前",(long)margin / (60)];
    }else if (margin < 60 * 60 * 24){
        return [NSString stringWithFormat:@"%ld小时前",(long)margin / (60 * 60)];
    }else if (margin < 60 * 60 * 24 * 10){
        return [NSString stringWithFormat:@"%ld天前",(long)margin / (60 * 60 * 24)];
    }else{
        return self;
    }
}


@end
