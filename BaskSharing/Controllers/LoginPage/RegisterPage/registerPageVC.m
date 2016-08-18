//
//  registerPageVC.m
//  BaskSharing
//
//  Created by 洋洋 on 16/8/17.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//注册密码
#import <AVOSCloud/AVOSCloud.h>
#import "registerPageVC.h"
#import "Common.h"
@interface registerPageVC ()
/**手机号 */
@property (weak, nonatomic) IBOutlet UITextField *textPhone;
/**验证码 */
@property (weak, nonatomic) IBOutlet UITextField *textTesting;
/**密码 */
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
/**确认密码*/
@property (weak, nonatomic) IBOutlet UITextField *textAgainPassword;

@end

@implementation registerPageVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBasicSetting];
}
#pragma mark 加载默认设置
-(void)loadBasicSetting
{
    //[self.view setBackgroundColor:RandomColor];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
-(void)dismissCurrentView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)iphoneOrEamilAction:(UISegmentedControl *)SegmentedControl
{
    NSInteger index = SegmentedControl.selectedSegmentIndex;
    if (index == 1)
    {
        /**打印此方法*/
        NSLog(@"%s\n邮箱注册",__func__);
    }
    else
    {
        /**打印此方法*/
        NSLog(@"%s\n手机注册",__func__);
    }

}

#pragma  mark 注册按钮
- (IBAction)BtnRegisterAction:(UIButton *)button
{
    /**手机号*/
    NSString *StrPhone = self.textPhone.text;
    NSString *StrTesting = self.textTesting.text;
    NSString *StrPassword = self.textPassword.text;
    NSString *StrAgainPW = self.textAgainPassword.text;
    if ([StrPhone isEqualToString:@""]||[StrPassword isEqualToString:@""]||[StrAgainPW isEqualToString:@""])
    {
        NSLog(@"手机号或密码为空");
    }
    else if ([StrPassword isEqualToString:StrAgainPW])
    {
        
        AVUser *user = [AVUser user];// 新建 AVUser 对象实例
        user.username =StrPhone;// 设置用户名
        user.password = StrPassword;// 设置密码
        //user.email = @"tom@leancloud.cn";// 设置邮箱
        user.email = StrTesting;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
            if (succeeded)
            {
                // 注册成功
                NSLog(@"注册成功");
                NSUserDefaults *userDdfaults = [NSUserDefaults standardUserDefaults];
                [userDdfaults setObject:user.username forKey:@"username"];
                [userDdfaults synchronize];
                
                [self dismissCurrentView];
            }
            else
            {
                // 失败的原因可能有多种，常见的是用户名已经存在。
                /**打印此方法*/
                NSLog(@"%s\n%@",__func__,error);
            }
        }];
    }
    //[AVOSCloud requestSmsCodeWithPhoneNumber:StrPhone callback:^(BOOL succeeded, NSError *error) {
        // 发送失败可以查看 error 里面提供的信息
      //  if (error)
       // {
            //NSLog(@"%s\n%@",__func__,error);
      //  }
   // }];
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
