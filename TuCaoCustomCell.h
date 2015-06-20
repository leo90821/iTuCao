//
//  TuCaoCustomCell.h
//  iTuCao
//
//  Created by NiYao on 15/5/15.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 自定义吐槽列表单元格
 **/

@interface TuCaoCustomCell : UITableViewCell
@property (strong, nonatomic) UILabel *tuCaoUserLabel;
@property (strong, nonatomic) UILabel *tuCaoContentLabel;
//@property (strong, nonatomic) UILabel *tuCaoDate;
@property (strong, nonatomic) UIImageView *tuCaoAvatarImageView;
@property CGFloat contentH;

/**
 * 设置单元格布局
 **/
- (void)setTuCaoFrames;

- (NSInteger)heightOfCell;
@end
