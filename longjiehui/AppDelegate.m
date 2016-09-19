//
//  AppDelegate.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/19.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeVC.h"
#import "ScheduleVC.h"
#import "StartVC.h"
#import "CommunicationVC.h"
#import "MeVC.h"
#import "LoginVC.h"
#import "GuidePages.h"
#import "LBTabBarController.h"


@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];//设置状态栏为白色；
 
    //根视图为首页的TabBar
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = [[LBTabBarController alloc] init];
//    // Override point for customization after application launch.
////    [self initTabBarController];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    
    //根视图为登录界面
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    LoginVC *vc = [[LoginVC alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = [LoginVC new];
    [self.window setRootViewController:navi];
    [self.window makeKeyAndVisible];
    
    [self guidePages];
    
//    LBTabBarController *tabBarVc = [[LBTabBarController alloc] init];
    
    
    CATransition *anim = [[CATransition alloc] init];
    anim.type = @"rippleEffect";
    anim.duration = 1.0;
    
    
    [self.window.layer addAnimation:anim forKey:nil];
    
    
//    self.window.rootViewController = tabBarVc;

    
    return YES;
}

- (void)guidePages
{
    //数据源
    NSArray *imageArray = @[ @"guide2", @"guide1", @"guide2", @"guide1" ];
    
    //  初始化方法1
    GuidePages *mzgpc = [[GuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(GuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [UIView animateWithDuration:0.0f
                         animations:^{
                             weakMZ.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakMZ removeFromSuperview];
                         }];
    };
    
    //  初始化方法2
    //    MZGuidePagesController *mzgpc = [[MZGuidePagesController alloc]
    //    initWithImageDatas:imageArray
    //                                                                            completion:^{
    //                                                                              NSLog(@"click!");
    //
    
    //要在makeKeyAndVisible之后调用才有效
    [self.window addSubview:mzgpc];
}



//- (void)initTabBarController {
//    //init tabbarcontroller
//    HomeVC *vc1 = [[HomeVC alloc] init];
//    ScheduleVC *vc2 = [[ScheduleVC alloc] init];
//    StartVC *vc3 = [[StartVC alloc] init];
//    CommunicationVC *vc4 = [[CommunicationVC alloc] init];
//    MeVC *vc5 = [[MeVC alloc] init];
//    
//    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
//    self.navController = nav1;
//    
//    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
//    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
//    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
//    
//    self.tabBarController = [[UITabBarController alloc] init];
//    self.tabBarController.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
//    self.tabBarController.delegate = self;
//    //    self.tabBarController.viewControllers = @[vc1,vc2,vc3,vc4];
//    //    self.tabBarController.hidesBottomBarWhenPushed = YES;
//    
////    LoginVC *lVC = [[LoginVC alloc]init];
////    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:lVC];
////    self.window.rootViewController = [LoginVC new];
////    [self.window setRootViewController:navi];
//    
//    //    self.navController = [[UINavigationController alloc] initWithRootViewController:self.tabBarController];
//    
//    //    self.window.rootViewController = self.tabBarController;
//    
////    LoginVC *lVC = [LoginVC new];
////    RegisterVC *lVC = [RegisterVC new];
//    
////    [[UINavigationBar appearance] setTintColor:[UIColor cyanColor]];
//    
////    [self.window setRootViewController:lVC];
//    
//    
//
//    
////     self.window.rootViewController = self.tabBarController;
//
//    
//    
//    
//    UITabBarItem *tabBarItem1 = [self.tabBarController.tabBar.items objectAtIndex:0];
//    UITabBarItem *tabBarItem2 = [self.tabBarController.tabBar.items objectAtIndex:1];
//    UITabBarItem *tabBarItem3 = [self.tabBarController.tabBar.items objectAtIndex:2];
//    UITabBarItem *tabBarItem4 = [self.tabBarController.tabBar.items objectAtIndex:3];
//    UITabBarItem *tabBarItem5 = [self.tabBarController.tabBar.items objectAtIndex:4];
//    
//    tabBarItem1.title = @"首页";
//    tabBarItem2.title = @"待办";
//    tabBarItem3.title = @"开始";
//    tabBarItem4.title = @"沟通";
//    tabBarItem5.title = @"我的";
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7) {
//        [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"fz"] withFinishedUnselectedImage:[UIImage imageNamed:@"home"]];
//        [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"db1"] withFinishedUnselectedImage:[UIImage imageNamed:@"db"]];
//        [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"ks"] withFinishedUnselectedImage:[UIImage imageNamed:@"ks"]];
//        [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"gt11"] withFinishedUnselectedImage:[UIImage imageNamed:@"gt"]];
//        [tabBarItem5 setFinishedSelectedImage:[UIImage imageNamed:@"wd1"] withFinishedUnselectedImage:[UIImage imageNamed:@"wd"]];
//        
//    } else {
//        tabBarItem1.selectedImage = [[UIImage imageNamed:@"fz"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        tabBarItem1.image = [[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        
//        tabBarItem2.selectedImage = [[UIImage imageNamed:@"db1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        tabBarItem2.image = [[UIImage imageNamed:@"db"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        
//        tabBarItem3.selectedImage = [[UIImage imageNamed:@"ks"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        tabBarItem3.image = [[UIImage imageNamed:@"ks"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        
//        tabBarItem4.selectedImage = [[UIImage imageNamed:@"gt11"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        tabBarItem4.image = [[UIImage imageNamed:@"gt"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        
//        tabBarItem5.selectedImage = [[UIImage imageNamed:@"wd1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//        tabBarItem5.image = [[UIImage imageNamed:@"wd"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    }
//    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:255.0/255 green:102.0/255 blue:0/255 alpha:1.0], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.sanniuben.longjiehui" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"longjiehui" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"longjiehui.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


+(AppDelegate *)sharedDelegate{
    return [UIApplication sharedApplication].delegate;
}



@end
