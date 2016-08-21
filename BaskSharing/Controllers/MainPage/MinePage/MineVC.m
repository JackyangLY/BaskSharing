//
//  MineVC.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/18.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//
#import "Common.h"
#import "MineVC.h"
//#import "MainTabBarVC.h"
#import "LoginPageVC.h"
@interface MineVC ()

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
      [self.view setBackgroundColor:[UIColor cyanColor]];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"em_me_spe_none_text"]];
    [self.view addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.center.equalTo(self.view);
         make.width.height.equalTo(imageview);
     }];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefaults objectForKey:@"username"];
    if (name == nil)
    {
        
        UIButton *logionbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [logionbutton setTitle:@"立即登录" forState:UIControlStateNormal];
        logionbutton.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:logionbutton];
        [logionbutton mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.bottom.equalTo(imageview.mas_top).offset(-8);
             make.centerX.equalTo(imageview);
             make.width.mas_equalTo(80);
             make.height.mas_equalTo(30);
         }];
        [logionbutton addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    /**右上角*/
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"注销" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [cancelButton setImage:[UIImage imageNamed:@"navigationButtonReturnN_15x21_@1x"] forState:UIControlStateNormal];
    [cancelButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick_15x21_"] forState:UIControlStateHighlighted];
    //backbutton.frame = CGSizeMake(36, 36);
    [cancelButton sizeToFit];
    cancelButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem = cancelItem;
    [cancelButton addTarget:self action:@selector(clickBtnCancelAction) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cancelButton];
//    //backbutton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//     // __weak typeof(self) weakSelf = self;
//    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make)
//     {
//         make.size.mas_equalTo(CGSizeMake(60, 30));
//         //make.top.mas_equalTo(weakSelf.navigationController.navigationBar).offset(22);
//     }];
    UIButton *sebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sebutton setImage:[UIImage imageNamed:@"mymassage-setting_21x44_"] forState:UIControlStateNormal];
    [sebutton setImage:[UIImage imageNamed:@"mymassage-setting-selected_21x44_"] forState:UIControlStateHighlighted];
    [sebutton sizeToFit];
    UIBarButtonItem *moonItem = [[UIBarButtonItem alloc]initWithCustomView:sebutton];
    self.navigationItem.rightBarButtonItem = moonItem;
    //self.navigationItem.rightBarButtonItems = @[moonItem,cancelItem];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)loginBtnAction
{
    
    LoginPageVC *loginVC = [[LoginPageVC alloc]init];
   // [self presentViewController:loginVC animated:YES completion:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}
-(void)clickBtnCancelAction
{
    LYNSlog
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
