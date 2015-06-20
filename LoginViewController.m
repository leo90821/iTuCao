//  iTuCao
//
//  Created by NiYao on 15/5/11.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "LoginViewController.h"
#import "AppMacro.h"
#import "ThreeViewsController.h"

@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLoginUI];
}

- (void)initLoginUI {
    self.navigationController.navigationBarHidden = YES;
    UIImageView *backgroudImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"_0123_sky.jpg"]];
    backgroudImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 16.0/9.0);
    [self.view addSubview:backgroudImage];
    //0.19 0.28 0.5
    
    UILabel *loginTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.17, SCREEN_WIDTH, 45)];
    loginTitle.text = APP_NAME;
    loginTitle.font = [UIFont boldSystemFontOfSize:30];
    loginTitle.textAlignment = NSTextAlignmentCenter;
    loginTitle.textColor = [UIColor whiteColor];
    [self.view addSubview: loginTitle];
    float textPointX = 45;
    float textPointY = SCREEN_HEIGHT * 0.28;
    float textWidth = SCREEN_WIDTH - 90;
    float textHeight = 45;
    self.userName = [[UITextField alloc] initWithFrame:CGRectMake(textPointX, textPointY, textWidth, textHeight)];
    [self.userName setBackgroundColor:[UIColor whiteColor]];
    self.userName.placeholder = @"用户名";
    //必须设置代理！以实现代理的协议方法
    self.userName.delegate = self;//代理是当前的视图控制器
    [self.view addSubview:self.userName];
    
    self.userPassword = [[UITextField alloc] initWithFrame:CGRectMake(textPointX, textPointY + 60, textWidth, textHeight)];
    self.userPassword.placeholder = @"密码";
    self.userPassword.secureTextEntry = YES;
    self.userPassword.delegate = self;
    [self.userPassword setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.userPassword];
    
    UILabel *forgotPwd = [[UILabel alloc]initWithFrame:CGRectMake(45, textPointY + 110, SCREEN_WIDTH - 90, 30)];
    forgotPwd.text = @"忘记密码？";
    forgotPwd.textColor = [UIColor colorWithRed:31.0/255.0 green:66.0/255.0 blue:96.0/255.0 alpha:1.0];
    forgotPwd.textAlignment = NSTextAlignmentRight;
    forgotPwd.font = [UIFont boldSystemFontOfSize:12];
    [self.view addSubview:forgotPwd];
    
    float buttonPointX = 45;
    float buttonPointY = textPointY + 140;
    float buttonWidth = SCREEN_WIDTH - 90;
    float buttonHeight = 45;
    float fontSize = 17;
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginButton.frame = CGRectMake(buttonPointX, buttonPointY, buttonWidth, buttonHeight);
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:31.0/255.0 green:66.0/255.0 blue:96.0/255.0 alpha:1.0]];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    self.loginButton.tag = 1;
    self.loginButton.enabled = YES;
    [self.loginButton addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    self.signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.signUpButton.frame = CGRectMake(buttonPointX, buttonPointY + buttonHeight + 60, buttonWidth, buttonHeight);
    [self.signUpButton setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:68.0/255.0 blue:75.0/255.0 alpha:1.0]];
    [self.signUpButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.signUpButton.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    self.signUpButton.tag = 2;
    self.signUpButton.enabled = YES;
    [self.signUpButton addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signUpButton];
 
    //设置点击手势
    UITapGestureRecognizer *closeKeyBoardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard)];
    [self.view addGestureRecognizer:closeKeyBoardTap];
}

#pragma mark - custom method

- (void)buttonDidClick:(UIButton *)sender {
    if (sender.tag == 1) {
        ThreeViewsController *mainViewController = [[ThreeViewsController alloc] init];
        [self.navigationController pushViewController:mainViewController animated:YES];
        //[self.navigationController setNavigationBarHidden:YES];
        [self.userName resignFirstResponder];
        [self.userPassword resignFirstResponder];
        self.loginButton.enabled = NO;
        self.signUpButton.enabled = NO;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ccc" message:@"jjj" delegate:nil cancelButtonTitle:@"adsaf" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)closeKeyBoard {
    [self.userPassword resignFirstResponder];
    [self.userName resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - text field delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
