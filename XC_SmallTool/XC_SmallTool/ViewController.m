//
//  ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/10.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUI];
}

-(void)setUI
{
    self.automaticallyAdjustsScrollViewInsets = NO ;
    [self.tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.dataSource = @[@"分段选择器标签自适应Demo1",@"分段选择器标签不适应Demo2",];
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
@end
