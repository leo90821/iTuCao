//
//  MiddleViewController.h
//  iTuCao
//
//  Created by NiYao on 15/5/18.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tuCaoTableView;

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSDictionary *dataDic;
@property CGFloat cellHeight;

@end
