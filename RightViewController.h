//
//  RightViewController.h
//  iTuCao
//
//  Created by NiYao on 15/5/12.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *rightMenuTableView;
@property (strong, nonatomic) NSArray *rightMenuData;

@end
