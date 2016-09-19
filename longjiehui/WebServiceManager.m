//
//  WebServiceManager.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/9/19.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager

+(WebServiceManager *)sharedInstance{
    static WebServiceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WebServiceManager alloc] initWithBaseURL:[NSURL URLWithString:__SERVICE_BASE_URL]];
    });
    return instance;
}

-(instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        NSMutableSet *mset = [NSMutableSet setWithSet:self.responseSerializer.acceptableContentTypes];
        [mset addObject:@"text/html"];
        [mset addObject:@"text/plain"];
        self.responseSerializer.acceptableContentTypes = mset;
    }
    return self;
}

-(NSURLSessionDataTask *)requstData:(BaseRequest *)rdata class:(Class)cls response:(void (^)(NSError *error, BaseResponse *response))block;{
    
    NSString *method = rdata.method;
    NSArray *methodArray = [method componentsSeparatedByString:@"/"];
    method = [NSString stringWithFormat:@"%@!%@.action",methodArray[0],methodArray[1]];
    NSLog(@"the request is %@",rdata.dictionary);
    return [self POST:method parameters:rdata.dictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BaseResponse *response = [[cls alloc] initWithDictionary:responseObject];
        NSLog(@"the response is %@",response.dictionary);
        [self showError:response];
        block(NULL,response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        block(error,NULL);
    }];
}

-(NSURLSessionDataTask *)requstData:(BaseRequest *)rdata constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))fileBlock responseclass:(Class)cl response:(void (^)(NSError *error, BaseResponse *response))block{
    return [self POST:rdata.method parameters:rdata.dictionary constructingBodyWithBlock:fileBlock progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BaseResponse *response = [[cl alloc] initWithDictionary:responseObject];
        [self showError:response];
        block(NULL,response);
        NSLog(@"response:%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        block(error,NULL);
        
    }];
}

-(void)showError:(BaseResponse *)response{
    if (response.errorCode.integerValue != 0) {
        [[THud sharedInstance] showtips:[self getErrorCode:response.errorCode.stringValue]];
        if (response.errorCode.integerValue == 10) {
            [[MemoryCache sharedInstance] clear];
            kRemoveStandardUserDefaults(kLoginUserKey);
            kStandardUserDefaultsSync;
            [[AppDelegate sharedDelegate] loadSignin];
        }
    }
}

-(NSString *)getErrorCode:(NSString *)code{
    static NSDictionary *errorCode = NULL;
    if (!errorCode) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ErrorCode" ofType:@"plist"];
        errorCode = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    }
    return errorCode[code];
}


@end
