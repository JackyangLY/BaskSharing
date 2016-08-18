//
//  LoginPageVC.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/17.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//登录页面
#import "Common.h"
#import "LoginPageVC.h"
#import <Masonry/Masonry.h>
#import <AVOSCloud/AVOSCloud.h>
#import "DisperseBtn.h"
#import "MainTabBarVC.h"
#import "registerPageVC.h"
#import "ResetPasswordVC.h"
@interface LoginPageVC ()
/**自定义DisperseBtn*/
@property (weak, nonatomic) DisperseBtn *disView;
/**显示的字*/
@property(nonatomic ,weak) UILabel *lab;
/**用户名*/
@property (weak, nonatomic) IBOutlet UITextField *lblUserName;
/**密码*/
@property (weak, nonatomic) IBOutlet UITextField *lblPassWord;

@end

@implementation LoginPageVC

-(void)viewWillAppear:(BOOL)animated
{
    self.lblUserName.text = nil;
    self.lblPassWord.text = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBasicSetting];
    self.title = @"登录";
}
#pragma mark 加载默认设置
-(void)loadBasicSetting
{
    /**散开button*/
    DisperseBtn *disView = [[DisperseBtn alloc]init];
    disView.frame = CGRectMake(8, LYSCREEN_HEIGHT-54,LYSCREEN_WIDTH*0.12,LYSCREEN_WIDTH*0.12);
    disView.borderRect = self.view.frame;
    disView.closeImage = [UIImage imageNamed:@"icon3"];
    disView.openImage = [UIImage imageNamed:@"icon1"];
    
//    UIButton *chookbutton = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:chookbutton];
    [self.view addSubview:disView];
    _disView = disView;
    [self setDisViewButtonsNum:4];
    
    //调试使用
    UILabel *lab = [UILabel new];
    lab.frame = CGRectMake(0,300, 300, 300);
    lab.font = [UIFont systemFontOfSize:30];
    lab.textAlignment = NSTextAlignmentCenter;
    _lab = lab;
    [self.view addSubview:lab];
}
/**添加散开button的image*/
#pragma  mark 散开button 基本设置
- (void)setDisViewButtonsNum:(int)num
{
    
    [_disView recoverBotton];
    
    for (UIView *btn in _disView.btns)
    {
        [btn removeFromSuperview];
    }
    
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i< num; i++)
    {
        UIButton *btn = [UIButton new];
        NSString *name = [NSString stringWithFormat:@"SC%d",i];
        [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [marr addObject:btn];
        btn.tag = i;
        [btn addTarget:self action:@selector(buttonTagget:) forControlEvents:UIControlEventTouchUpInside];
    }
    _disView.btns = [marr copy];
}
#pragma  mark 选择散开buttn的index
-(void)buttonTagget:(UIButton *)button
{
    self.lab.text = [NSString stringWithFormat:@"点击了第%ld个按钮",button.tag+1];
    NSInteger index = button.tag;
    if (index == 0)
    {
        
    }
}
#pragma  mark 登录按钮
- (IBAction)loginBtnAction:(UIButton *)button
{
      /**取出用户名和密码*/
    NSString *strUserName = self.lblUserName.text;
    NSString *strPassWord = self.lblPassWord.text;
    if ([strUserName isEqualToString:@""]||[strPassWord isEqualToString:@""])
    {
        /**打印此方法*/
        NSLog(@"%s\n用户名或密码为空",__func__);
        return;
     }
     else
    {
        /**保存使用异步*/
        [AVUser logInWithUsernameInBackground:self.lblUserName.text password:self.lblPassWord.text block:^(AVUser *user, NSError *error) {
            if (user)
            {
                /**打印此方法*/
                NSLog(@"%s\n登录成功",__func__);
                MainTabBarVC *mainVC = [MainTabBarVC new];
                //[self.navigationController pushViewController:mainVC animated:YES];
                [self presentViewController:mainVC animated:YES completion:nil];
                
                NSUserDefaults  *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:self.lblUserName.text forKey:@"username"];
                //保存
                [userDefaults synchronize];
            }
            else
            {
                NSLog(@"%@",error);
            }
        }];
    }
}
#pragma  mark 重置密码
/**重置密码按钮*/
- (IBAction)BtnResetPassWordAction:(UIButton *)button
{
    ResetPasswordVC *resetPWVC = [ResetPasswordVC new];
    //[self presentViewController:resetPWVC animated:YES completion:nil];
     [self.navigationController pushViewController:resetPWVC animated:YES];
    
}
#pragma  mark 注册页面
/**注册按钮*/
- (IBAction)BnRegiseterVCAction:(UIButton *)button
{
    registerPageVC *registerVC = [registerPageVC new];
    //[self presentViewController:registerVC animated:YES completion:nil];
     [self.navigationController pushViewController:registerVC animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.lab.text = @"点击屏幕";
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
