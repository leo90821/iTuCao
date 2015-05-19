//
//  ThreeViewsController.m
//  iTuCao
//
//  Created by NiYao on 15/5/12.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "ThreeViewsController.h"
#import "AppMacro.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "MiddleViewController.h"

@interface ThreeViewsController ()

@end

@implementation ThreeViewsController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initChildController];
    [self initContent];
}

- (void)initBackground {
    [self.view setBackgroundColor: [UIColor whiteColor]];
    UIImage *background = [UIImage imageNamed:@"_0124_.jpeg"];
    self.bgImgView = [[UIImageView alloc] initWithImage:background];
    self.bgImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * DEVICE_SCALE);
    [self.view insertSubview:self.bgImgView atIndex:0];
}

- (void)initContent {

    self.customNavBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MIDDLE_NAVBAR_HEIGHT)];
    [self.customNavBar setBackgroundColor:DARKBLUE];
    UIButton *leftMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftMenu.frame = CGRectMake(10, 20, 30, 30);
    [leftMenu setBackgroundImage:[UIImage imageNamed:@"orange.png"] forState:UIControlStateNormal];
    [leftMenu addTarget:self action:@selector(showLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightMenu.frame = CGRectMake(SCREEN_WIDTH - 40, 20, 30, 30);
    [rightMenu setBackgroundImage:[UIImage imageNamed:@"strawberry.png"] forState:UIControlStateNormal];
    [rightMenu addTarget:self action:@selector(showRightMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.customNavBar addSubview:leftMenu];
    [self.customNavBar addSubview:rightMenu];
    [self.view addSubview:self.customNavBar];
}

- (void)initChildController {
    //create objects
    self.leftView = [[LeftViewController alloc] init];
    self.rightView = [[RightViewController alloc] init];
    self.midView = [[MiddleViewController alloc] init];
    
    //add child vc
    [self addChildViewController:self.rightView];
    [self addChildViewController:self.leftView];
    [self addChildViewController:self.midView];
    
    [self.view addSubview:self.rightView.view];
    [self.view addSubview:self.leftView.view];
    [self.view addSubview:self.midView.view];
}

- (void)showLeftMenu:(id)sender {
    //animate to show left menu
    NSTimeInterval duration = 0.2;
    if (self.midView.view.frame.origin.x == 0) {
        [UIView animateWithDuration:duration
                         animations:^(void) {
                             CGFloat height = SCREEN_HEIGHT - 2 * LEFT_MENU_MARGIN;
                             CGFloat width = height * DEVICE_SCALE_W_H;
                             NSLog(@"%.2f,%.2f,%.2f", width, height, DEVICE_SCALE_W_H);
                             self.customNavBar.frame = CGRectMake(LEFT_MENU_WIDTH, LEFT_MENU_MARGIN, width, MIDDLE_NAVBAR_HEIGHT);
                             self.leftView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.rightView.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.midView.view.frame = CGRectMake(LEFT_MENU_WIDTH, LEFT_MENU_MARGIN, width, height);
                         }
                         completion:^(BOOL finish) {}];
    } else {
        [UIView animateWithDuration:duration
                         animations:^(void) {
                             self.midView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.rightView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.leftView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.customNavBar.frame = CGRectMake(0, 0, SCREEN_HEIGHT, MIDDLE_NAVBAR_HEIGHT);
                         }];
    }
}

- (void)showRightMenu:(id)sender {
    NSTimeInterval duration = 0.2;
    if (self.midView.view.frame.origin.x == 0) {
        [UIView animateWithDuration:duration
                         animations:^(void) {
                             CGFloat x = - RIGHT_MENU_WIDTH;
                             self.customNavBar.frame = CGRectMake(x, 0, SCREEN_WIDTH, MIDDLE_NAVBAR_HEIGHT);
                             self.midView.view.frame = CGRectMake(x, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.leftView.view.frame = CGRectMake(x, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             }];
    } else {
        [UIView animateWithDuration:duration
                         animations:^(void) {
                             self.leftView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.midView.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                             self.customNavBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, MIDDLE_NAVBAR_HEIGHT);
                         }];
    }
}

- (void)backToLogin:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
