//
//  ThreeViewsController.h
//  iTuCao
//
//  Created by NiYao on 15/5/12.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MiddleViewController;
@class LeftViewController;
@class RightViewController;

@interface ThreeViewsController : UIViewController

@property (strong, nonatomic) MiddleViewController *midView;
@property (strong, nonatomic) LeftViewController *leftView;
@property (strong, nonatomic) RightViewController *rightView;
@property (strong, nonatomic) UIImageView *bgImgView;
@property (strong, nonatomic) UIView *customNavBar;

@end
