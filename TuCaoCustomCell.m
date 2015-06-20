//
//  TuCaoCustomCell.m
//  iTuCao
//
//  Created by NiYao on 15/5/15.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "TuCaoCustomCell.h"
#import "AppMacro.h"

@implementation TuCaoCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCellStyle];
        
        self.tuCaoAvatarImageView = [[UIImageView alloc] init];
        self.tuCaoUserLabel = [[UILabel alloc] init];
        self.tuCaoContentLabel = [[UILabel alloc] init];

        //content view subview
        [self.contentView addSubview:self.tuCaoAvatarImageView];
        [self.contentView addSubview:self.tuCaoContentLabel];
        [self.contentView addSubview:self.tuCaoUserLabel];
        [self setTuCaoFrames];
    }
    return self;
}

- (void)initCellStyle {
    [self.contentView setBackgroundColor:[UIColor clearColor]];
//    self.contentView.frame = CGRectMake(0, 0, 300, 300);
}

- (void)setTuCaoAvatarImageView:(UIImageView *)TuCaoAvatarImageView {
    if (_tuCaoAvatarImageView == nil) {
        _tuCaoAvatarImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.tuCaoAvatarImageView];
    }
}

- (void)setTuCaoContentLabel:(UILabel *)TuCaoContentLabel {
    if (_tuCaoContentLabel == nil) {
        _tuCaoContentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.tuCaoContentLabel];
    }
}

- (void)setTuCaoUserLabel:(UILabel *)TuCaoUserLabel {
    if (_tuCaoUserLabel == nil) {
        _tuCaoUserLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.tuCaoUserLabel];
    }
}

- (void)setTuCaoFrames {
    //avatar frame
    _tuCaoAvatarImageView.frame = CGRectMake(TUCAO_PADDING, TUCAO_PADDING, TUCAO_AVATAR_WIDTH, TUCAO_AVATAR_HEIGHT);
    //content frame
    CGFloat contentX = TUCAO_PADDING;
    CGFloat contentY = TUCAO_PADDING * 2 + TUCAO_AVATAR_HEIGHT;
    CGFloat contentW = 280 - 2 * TUCAO_PADDING;
    self.contentH = [self sizeWithString:self.tuCaoContentLabel.text font:TUCAO_CONTENT_FONT].height;
    NSLog(@"%f", [self sizeWithString:self.tuCaoContentLabel.text font:TUCAO_CONTENT_FONT].height);
    _tuCaoContentLabel.frame = CGRectMake(contentX, contentY, contentW, self.contentH);
    _tuCaoContentLabel.numberOfLines = 0;
    //user
    CGFloat userX = TUCAO_AVATAR_WIDTH + 2 * TUCAO_PADDING;
    CGFloat userY = 20;
    _tuCaoUserLabel.frame = CGRectMake(userX, userY, 100, 30);
}

- (NSInteger)heightOfCell {
    return TUCAO_PADDING * 3 + self.contentH + TUCAO_AVATAR_HEIGHT;
}

- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(280, 1000)
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName : font}
                                       context:nil];
    return rect.size;
}

@end
