//
//  MainVC.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/18.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//

#import "MainVC.h"
#import "Common.h"
#import "KTDropdownMenuView.h"
@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBasicSetting];
    [self.view setBackgroundColor:[UIColor redColor]];
    UIButton *chookbutton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:chookbutton];
    UIButton *buttonN = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonN setImage:[UIImage imageNamed:@"editer_mark_27x20_"] forState:UIControlStateNormal];
    [buttonN setImage:[UIImage imageNamed:@"editer_mark_click_27x20_"] forState:UIControlStateHighlighted];
    [buttonN sizeToFit];    //buttonN.frame = CGRectMake(0, 22, 36, 36);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonN];
    buttonN.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//    [buttonN mas_makeConstraints:^(MASConstraintMaker *make)
//    {
//      make.top.equalTo(self.view).offset(22);
//     make.top.equalTo(self.navigationItem).offset(22);
//        make.width.height.mas_equalTo(36);
//    }];
   
        // Do any additional setup after loading the view from its nib.
}

#pragma mark 加载默认设置
-(void)loadBasicSetting
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.244 green:0.476 blue:1.000 alpha:0.200]];
    NSArray *titles = @[@"首页", @"朋友圈", @"我的关注", @"明星", @"家人朋友"];
    KTDropdownMenuView *menuView = [[KTDropdownMenuView alloc] initWithFrame:CGRectMake(0, 0,100, 44) titles:titles];
    menuView.selectedAtIndex = ^(int index)
    {
        NSLog(@"selected title:%@", titles[index]);
    };
    menuView.width = 300;
    self.navigationItem.titleView = menuView;
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
