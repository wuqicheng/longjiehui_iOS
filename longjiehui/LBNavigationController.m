//
//  LBNavigationController.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/26.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "LBNavigationController.h"

#import "LBTabBarController.h"
#import "UIImage+Image.h"
//黄色导航栏
#define NavBarColor [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1.0]


@interface LBNavigationController ()

@end

@implementation LBNavigationController

+ (void)load
{
    
    
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:19];
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    [bar setBackgroundImage:[UIImage imageWithColor:NavBarColor] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
    
    dicBar[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [bar setTitleTextAttributes:dic];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        
        
        
        
    }
    
    return [super pushViewController:viewController animated:animated];
}


@end
