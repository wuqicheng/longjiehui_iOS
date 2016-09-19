//
//  GuidePages.h
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/26.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuidePages : UIView

@property (nonatomic, strong) NSArray *imageDatas;
@property (nonatomic, copy) void (^buttonAction)();

- (instancetype)initWithImageDatas:(NSArray *)imageDatas completion:(void (^)(void))buttonAction;


@end
