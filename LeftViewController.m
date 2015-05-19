//
//  LeftViewController.m
//  iTuCao
//
//  Created by NiYao on 15/5/12.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "LeftViewController.h"
#import "AppMacro.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2_moonearth.jpg"]];
    background.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:background];
    
    self.leftMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, LEFT_MENU_MARGIN, LEFT_MENU_WIDTH, SCREEN_HEIGHT)
                                                     style:UITableViewStylePlain];
    self.leftMenuData = @[@"关于iTuCao", @"Web iTuCao", @"图片集", @"设置"];

    self.leftMenuTableView.delegate = self;
    self.leftMenuTableView.dataSource = self;
    self.leftMenuTableView.layer.borderColor = [[UIColor clearColor] CGColor];
    self.leftMenuTableView.layer.borderWidth = 0.0;
    self.leftMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *menuBackGround = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [menuBackGround setBackgroundColor:[UIColor clearColor]];
    [menuBackGround addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2_moonearth.jpg"]]];
    [self.leftMenuTableView setBackgroundView:menuBackGround];
    [self.leftMenuTableView setBackgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.leftMenuTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.leftMenuData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"LeftMenu";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.text = self.leftMenuData[indexPath.row];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        cell.imageView.image = [UIImage imageNamed:@"_0025_star.png"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
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
