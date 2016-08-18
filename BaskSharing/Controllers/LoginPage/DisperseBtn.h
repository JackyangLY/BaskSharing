//
//  DisperseBtn.h
//  button散开
//
//  Created by on 16/1/17.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisperseBtn : UIView
//边界
@property (assign, nonatomic) CGRect borderRect;
@property (strong, nonatomic) UIImage *closeImage;
@property (strong, nonatomic) UIImage *openImage;
@property (nonatomic ,copy)NSArray *btns;
//回收按钮
-(void)recoverBotton;
@end
