//
//  LBTabBarController.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/26.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "LBTabBarController.h"

#import "LBNavigationController.h"

#import "HomeVC.h"
#import "ScheduleVC.h"
#import "StartVC.h"
#import "CommunicationVC.h"
#import "MeVC.h"

#import "LBTabBar.h"
#import "UIImage+Image.h"

@interface LBTabBarController ()<LBTabBarDelegate>

@end

@implementation LBTabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
//    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1.0];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    LBTabBar *tabbar = [[LBTabBar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    
}


#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{
    
    
    HomeVC *homeVC = [[HomeVC alloc] init];
    [self setUpOneChildVcWithVc:homeVC Image:@"home" selectedImage:@"fz" title:@"首页"];
    
    ScheduleVC *scheduleVC = [[ScheduleVC alloc] init];
    [self setUpOneChildVcWithVc:scheduleVC Image:@"db" selectedImage:@"db1" title:@"待办"];
    
    CommunicationVC *communicationVC = [[CommunicationVC alloc] init];
    [self setUpOneChildVcWithVc:communicationVC Image:@"gt" selectedImage:@"gt11" title:@"沟通"];
    
    MeVC *meVC = [[MeVC alloc] init];
    [self setUpOneChildVcWithVc:meVC Image:@"wd" selectedImage:@"wd1" title:@"我的"];
    
    
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    LBNavigationController *nav = [[LBNavigationController alloc] initWithRootViewController:Vc];
    
    
//    Vc.view.backgroundColor = [self randomColor];
      Vc.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}



#pragma mark - ------------------------------------------------------------------
#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(LBTabBar *)tabBar
{
    
    
    StartVC *startVC = [[StartVC alloc] init];
    startVC.view.backgroundColor = [self randomColor];
    
    LBNavigationController *navVc = [[LBNavigationController alloc] initWithRootViewController:startVC];
    
    [self presentViewController:navVc animated:YES completion:nil];
    
    
    
}


- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

@end
