//
//  ViewController.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/17.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//首页TabBar控制器

#import "Common.h"
#import "MainTabBarVC.h"
#import "LoginPageVC.h"
#import "MainVC.h"
#import "FindVC.h"
#import "ShareVC.h"
#import "MessageVC.h"
#import "MineVC.h"
@interface MainTabBarVC ()

@end

@implementation MainTabBarVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self loadDefaultsting];
}
-(void)loadDefaultsting
{
    //self.title = @"首页";
    //    UIButton *chookbutton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:chookbutton];
    MainVC  *mianvc = [[MainVC alloc]init];
    [self addViewController:mianvc imageName:nil title:@"首页"];
    FindVC  *findvc = [[FindVC alloc]init];
    [self addViewController:findvc imageName:nil title:@"发现"];
    ShareVC *sharevc = [[ShareVC alloc]init];
    [self addViewController:sharevc imageName:nil title:@"一起"];
    MessageVC *messagevc = [[MessageVC alloc]init];
    [self addViewController:messagevc imageName:nil title:@"消息"];
    MineVC *minevc = [[MineVC alloc]init];
    [self addViewController:minevc imageName:nil title:@"我的"];
    
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [leftBtn addTarget:self action:@selector(ClickLeftBtnAction) forControlEvents:UIControlEventTouchUpInside];
 }
- (void)addViewController:(UIViewController *)viewController imageName:(NSString *)imageName title:(NSString *)title {
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];
    //viewController.tabBarItem.title = title;
    viewController.title = title;
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    // 创建一个导航控制器
    UINavigationController *vcNav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // 把导航控制器添加到TanBarController中
    [self addChildViewController:vcNav];
}

#pragma  mark 点击左边的按钮
-(void)ClickLeftBtnAction
{
    /**打印此方法*/
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    LoginPageVC *loginVC = [LoginPageVC new];
//    [self presentViewController:loginVC animated:YES completion:nil];
    /**打印此方法*/
    NSLog(@"%s 点击屏幕",__func__);
    //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //移除UserDefaults中存储的用户信息
    [userDefaults removeObjectForKey:@"name"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];
}
@end
