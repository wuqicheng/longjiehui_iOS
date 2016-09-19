//
//  NSString+ZBUtilites.m
//  BookReader
//
//  Created by zhangbin on 8/4/13.
//  Copyright (c) 2013 ZoomBin. All rights reserved.
//

#import "NSString+ZBUtilites.h"

@implementation NSString (ZBUtilites)

- (BOOL)areAllCharactersSpace;
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0;
}

+ (NSString *)ChineseSpace
{
	return @"　";
}

+ (NSString *)dashLineWithLength:(NSUInteger)length
{
	NSMutableString *line = [NSMutableString string];
	for (int i = 0; i < length; i++) {
		[line appendString:@"-"];
	}
	return line;
}

+ (NSString *)dottedLineWithLength:(NSUInteger)length
{
	NSMutableString *line = [NSMutableString string];
	for (int i = 0; i < length; i++) {
		[line appendString:@"."];
	}
	return line;
}

+ (NSString *)appStoreLinkWithAppID:(NSString *)appID
{
	return [NSString stringWithFormat:@"https://itunes.apple.com/app/id%@?mt=8", appID];
}

@end
