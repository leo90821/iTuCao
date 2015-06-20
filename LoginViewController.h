//
//  LoginViewController.h
//  iTuCao
//
//  Created by NiYao on 15/5/11.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) UITextField *userName;        //  用户名输入框
@property (strong, nonatomic) UITextField *userPassword;    //  用户密码输入框
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *signUpButton;


@end
