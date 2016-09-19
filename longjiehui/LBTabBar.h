//
//  LBTabBar.h
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/26.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LBTabBar;

@protocol LBTabBarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(LBTabBar *)tabBar;
@end


@interface LBTabBar : UITabBar

/** tabbar的代理 */
@property (nonatomic, weak) id<LBTabBarDelegate> myDelegate ;


@end
