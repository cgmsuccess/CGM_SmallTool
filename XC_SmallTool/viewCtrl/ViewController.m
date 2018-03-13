//
//  ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/10.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "ViewController.h"
#import "XCTabBarViewController.h"
#import "UIBarButtonItem+Extension.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableVIew;
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

-(UITableView *)tableVIew
{
    if (!_tableVIew) {
        _tableVIew = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavbarHeight, KmainScreenWidth, KmainScreenHeiht - kNavbarHeight - kBottomSafeHeight) style:UITableViewStyleGrouped];
        _tableVIew.delegate = self;
        _tableVIew.dataSource = self;
        
        if (@available(iOS 11.0, *)) {
            self.tableVIew.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        self.tableVIew.estimatedRowHeight = 0;
        self.tableVIew.estimatedSectionHeaderHeight = 0;
        self.tableVIew.estimatedSectionFooterHeight = 0;
    }
    return _tableVIew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO ;
    [self setUI];
}

-(void)setUI
{
    [self.tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.dataSource = @[@"分段选择器标签自适应Demo1",@"分段选择器标签不适应Demo2",@"照片选择Demo3",@"一级选择器Demo4",@"简单的泡泡Demo5"];
    [self.view addSubview:self.tableVIew];
    
    
    /* 设置导航栏上面的内容 */
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    
    //设置角标
    XCTabBarViewController *tabbr =  (XCTabBarViewController *)[UIApplication  sharedApplication].keyWindow.rootViewController ;
    UITabBarItem * item =[tabbr.tabBar.items objectAtIndex:0];
    item.badgeValue=[NSString stringWithFormat:@"demo"];;
}

#pragma mark touch  事件
-(void)friendSearch
{
    XCLog(@"left");
}

-(void)pop
{
    XCLog(@"right");
}


#pragma mark UItableVIewDelegate UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *title = self.dataSource[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *title = self.dataSource[indexPath.row];
    NSRange range = [title rangeOfString:@"Demo"];
    NSString *subTitle = [title substringToIndex:range.location];
    NSString *subTitle1 = [title substringFromIndex:range.location];
    NSLog(@"subTitle = %@ subTitle1 = %@ ",subTitle ,subTitle1 );
    NSString *ctrlTitle = [NSString stringWithFormat:@"%@ViewController",subTitle1];
    UIViewController *vc = [NSClassFromString(ctrlTitle) new];
    [self.navigationController pushViewController:vc animated:YES];
   
}

#pragma mark 为了适配IOS 11 出现 控制头部尾部高度问题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

@end
