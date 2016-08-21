//
//  Common.h
//  BaskSharing
//
//  Created by 洋洋 on 16/8/17.
//  Copyright © 2016年 Jack_yy. All rights reserved.
//

#ifndef Common_h
#define Common_h
/**随机色*/
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define LYSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define LYSCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
/**打印此方法*/
#define   LYNSlog NSLog(@"%s",__func__);

#import <Masonry/Masonry.h>
#import "UIBarButtonItem+BarButtonItemManager.h"
#import "LYNavigationViewController.h"
#endif /* Common_h */
