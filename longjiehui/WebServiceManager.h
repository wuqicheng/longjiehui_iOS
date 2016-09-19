//
//  WebServiceManager.h
//  longjiehui
//
//  Created by 三牛犇科技 on 16/9/19.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "BaseRequest.h"
#import "BaseResponse.h"

@interface WebServiceManager : AFHTTPSessionManager

+(WebServiceManager *)sharedInstance;
-(NSURLSessionDataTask *)requstData:(BaseRequest *)rdata class:(Class)cls response:(void (^)(NSError *error, BaseResponse *response))block;
-(NSURLSessionDataTask *)requstData:(BaseRequest *)rdata constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))fileBlock responseclass:(Class)cl response:(void (^)(NSError *error, BaseResponse *response))block;

@end
