//
//  MiddleViewController.m
//  iTuCao
//
//  Created by NiYao on 15/5/18.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "MiddleViewController.h"
#import "AppMacro.h"
#import "TuCaoCustomCell.h"

@interface MiddleViewController ()

@end

@implementation MiddleViewController
static NSString *identifier = @"TuCao";

//看之前写的代码真心好烂！
//凑活看吧。。。。囧

- (void)viewDidLoad {
    [super viewDidLoad];
    //    // Do any additional setup after loading the view, typically from a nib.
    //[self buildGroupedTableView];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hillsea.jpg"]];
    background.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:background];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, SCREEN_HEIGHT-60) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[TuCaoCustomCell class] forCellReuseIdentifier:identifier];//注册自定义cell
    
    [self buildCustomTuCaoUI];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];//刷新
}
//创建基本UI
- (void)buildCustomTuCaoUI {
    
    UIImage *avatar = [UIImage imageNamed:@"_0124_avatar_1.jpeg"];
    //暂时用字典 下个版本需要先封装好 数据模型类 网络请求类 业务逻辑代理
    //用网络请求回传的json，解析为字典，创建并初始化数据对象
    NSDictionary *tu1 =  @{@"avatar" : avatar,
                           @"user" : @"nycode",
                           @"content" : @"1.微信聊天和新浪微博仿做;2.i吐槽功能实现，UI做完;3.吐槽内容后台接口程序;4.吐槽图片上传后台程序;5.webimage&afnetworking三方库;6.手势和集合视图，照片，图片;7.深入浅出cocoa;8.cocoapods使用;9.uitabcontroller 的使用；10关于layer frame bound 等属性的探究；11uiview uiviewcontroller uicontrol 等的继承关系；12.封装自己的框架"
                           };
    NSDictionary *tu2 =  @{@"avatar" : avatar,
                           @"user" : @"nycode",
                           @"content" : @"知道自己想要的，并努力为之奋斗"
                           };
    NSDictionary *tu3 =  @{@"avatar" : avatar,
                           @"user" : @"nycode",
                           @"content" : @"其实我想要的很简单就是想成为完全独立的开发者，不论前端后端，不论oc，php，js，html，css，Java，c++，我都可以得心应手。我一定要成为一个优秀的软件工程师！其他的别无所求。性格里很执着，有点偏执，但是真诚且意志力极强，决不放弃！"
                           };
    NSDictionary *tu4 =  @{@"avatar" : avatar,
                           @"user" : @"nycode",
                           @"content" : @"这么执着略带偏执的人你会喜欢吗？所以，真正能接受全部你的那个人才是你真正的伴侣，旁人只是看到了令他们快乐的那一面而心生喜欢，而忽略了独一无二的真正的你。或者那些只接受两他们愉悦的你的人，也只能是一般关系，而非更亲密的人。所以，对于只接受部分你的人又何必太在意他们是否喜欢或讨厌。只是过客罢了"
                           };
    self.dataArray = @[tu1, tu2, tu3, tu4, tu2, tu3, tu4, tu2, tu3, tu4, tu2, tu3, tu4, tu2, tu3, tu4];
//创建初始化 表视图
}

#pragma mark - table view datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    //table view的重用机制
    TuCaoCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.tuCaoAvatarImageView.image = [self.dataArray[row] objectForKey:@"avatar"];
    cell.tuCaoContentLabel.text = [self.dataArray[row] objectForKey:@"content"];
    cell.tuCaoUserLabel.text = [self.dataArray[row] objectForKey:@"user"];
    [cell setTuCaoFrames];
    cell.backgroundColor = [UIColor clearColor];
    
    self.cellHeight = [cell heightOfCell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)stringFont {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 2*TUCAO_PADDING, 1000)
                                       options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesDeviceMetrics
                                    attributes:@{NSFontAttributeName:stringFont}
                                       context:nil];
    return rect.size;
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
