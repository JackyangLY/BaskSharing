//
//  FindVC.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/18.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//
#import "Common.h"
#import "FindVC.h"
#import "SearchViewController.h"
@interface FindVC ()

@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    [self.view setBackgroundColor:[UIColor blueColor]];
    UIButton *chookbutton = [[UIButton alloc]init];
    //UIButton *chookbutton = [[UIButton alloc]initWithFrame:CGRectMake(337, 11, 35, 35)];
    [chookbutton setImage:[UIImage imageNamed:@"tab_explore"] forState:UIControlStateNormal];
    [chookbutton setImage:[UIImage imageNamed:@"tabAll_pressed"] forState:UIControlStateHighlighted];
    [chookbutton sizeToFit];
    [chookbutton addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:chookbutton];
//    [chookbutton mas_makeConstraints:^(MASConstraintMaker *make)
//     {
//         //make.top.equalTo(self.navigationItem).offset(11);
//         //make.top.equalTo(self.navigationItem).offset(11);
//        // make.right.equalTo(self.navigationItem).offset(-38);
//         make.width.height.mas_equalTo(22);
//     }];
    // Do any additional setup after loading the view from its nib.
}
-(void)clickBtnAction:(UIButton *)button
{
    SearchViewController *btnVC = [SearchViewController new];
    [self.navigationController pushViewController:btnVC animated:YES];
    btnVC.view.backgroundColor = [UIColor yellowColor];
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
