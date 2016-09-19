//
//  NSString+Attribute.m
//  EShoping
//
//  Created by Seven on 14-12-1.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "NSString+Attribute.h"

@implementation NSString (Attribute)

-(NSString *)attribute{
    NSArray *array = [self componentsSeparatedByString:@","];
    NSArray *attrs = [[array firstObject] componentsSeparatedByString:@"\""];
    if (attrs.count < 2) {
        return @"id";
    }
    NSString *attr = [attrs objectAtIndex:1];
    return attr;
}

@end
