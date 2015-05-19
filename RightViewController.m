//
//  RightViewController.m
//  iTuCao
//
//  Created by NiYao on 15/5/12.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "RightViewController.h"
#import "AppMacro.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBackground];
    [self initAvatar];
    [self initRightMenuTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initBackground {
    UIImageView *backgroudImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lake.jpg"]];
    backgroudImg.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:backgroudImg];
}

- (void)initAvatar {
    CGFloat avatarX = SCREEN_WIDTH - 165;
    CGFloat avatarY = 60;
    CGFloat avatarW = 110;
    CGFloat avatarH = avatarW;
    CGFloat avatarR = avatarW / 2.0;
    UIImageView *avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"_0124_avatar_1.jpeg"]];
    avatar.layer.masksToBounds = YES;
    avatar.layer.cornerRadius = avatarR;
    avatar.frame = CGRectMake(avatarX, avatarY, avatarW, avatarH);
    [self.view addSubview:avatar];
}

- (void)initRightMenuTableView {
    CGFloat tableX = SCREEN_WIDTH - RIGHT_MENU_WIDTH;
    CGFloat tableY = 200;
    CGFloat tableW = RIGHT_MENU_WIDTH;
    CGFloat tableH = SCREEN_HEIGHT - tableY;
    self.rightMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(tableX, tableY, tableW, tableH) style:UITableViewStylePlain];
    [self.view addSubview:self.rightMenuTableView];
    
    self.rightMenuData = @[@"用户信息", @"设置", @"登出"];
    self.rightMenuTableView.delegate = self;
    self.rightMenuTableView.dataSource = self;
    
    self.rightMenuTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lake.jpg"]];
    self.rightMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightMenuTableView.backgroundColor = [UIColor clearColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rightMenuData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"RightMenu";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.text = self.rightMenuData[indexPath.row];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return cell;
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
