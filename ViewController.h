//
//  ViewController.h
//  iTuCao
//
//  Created by NiYao on 15/5/9.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSDictionary *dataDic;

@end

