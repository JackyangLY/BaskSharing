//
//  AppDelegate.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/17.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//
#import <AVOSCloud/AVOSCloud.h>
#import "AppDelegate.h"
#import "LoginPageVC.h"
#import "MainTabBarVC.h"
#define umengshaifenxiangAppkey @"57b424f3e0f55a657400295c"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // 如果使用美国站点，请加上下面这行代码：
    // [AVOSCloud setServiceRegion:AVServiceRegionUS];
    
    [AVOSCloud setApplicationId:@"vKowORngzhqdK1IEf8LUOPia-gzGzoHsz" clientKey:@"0Eiq4pMyN2ioXEOQGEOAwlOY"];
    NSUserDefaults *userDefault =[NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"username"];
   // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoginPageVC *loginVC = [LoginPageVC new];
    if (name == nil)
    {
        NSLog(@"%@",name);
        UINavigationController *NaviVC = [[UINavigationController alloc]initWithRootViewController:loginVC];
    self.window.rootViewController = NaviVC;
    }
    else
    {
        /**打印此方法*/
        NSLog(@"%s\n跳到首页",__func__);
        MainTabBarVC *mainvc = [MainTabBarVC new];
//        UINavigationController *NaviVC = [[UINavigationController alloc]initWithRootViewController:mainvc];
        self.window.rootViewController = mainvc;
        
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
