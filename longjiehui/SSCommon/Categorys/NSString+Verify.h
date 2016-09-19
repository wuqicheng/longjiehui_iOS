//
//  NSString+Verify.h
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

-(BOOL)isEmailType;
//default is china. country is 'CN'
-(BOOL)isPhone;

-(BOOL)isPhoneWithCountry:(NSString *)code;

@end
