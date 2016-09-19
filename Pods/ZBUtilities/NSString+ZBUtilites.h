//
//  NSString+ZBUtilites.h
//  BookReader
//
//  Created by zhangbin on 8/4/13.
//  Copyright (c) 2013 ZoomBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZBUtilites)

- (BOOL)areAllCharactersSpace;
+ (NSString *)ChineseSpace;
+ (NSString *)dashLineWithLength:(NSUInteger)length;
+ (NSString *)dottedLineWithLength:(NSUInteger)length;
+ (NSString *)appStoreLinkWithAppID:(NSString *)appID;

@end
