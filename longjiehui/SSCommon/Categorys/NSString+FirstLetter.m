//
//  NSString+FirstLetter.m
//  MeChef
//
//  Created by Seven on 15/8/7.
//  Copyright (c) 2015年 Fuego. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)

-(NSString *)firstLetter{
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (CFStringRef)self);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin,NO);
    NSString *pinyin = (__bridge NSString *)string;
    NSString *firtletter = NULL;
    if (pinyin.length) {
        firtletter = [pinyin substringToIndex:1];
    }else{
        firtletter = @"#";
    }
    firtletter = [firtletter uppercaseString];
    return firtletter;
}

@end
