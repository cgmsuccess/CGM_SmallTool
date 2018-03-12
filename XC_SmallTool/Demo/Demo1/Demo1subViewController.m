//
//  Demo1subViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/10.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo1subViewController.h"

@interface Demo1subViewController ()

@end

@implementation Demo1subViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor ;
    
    XCLog(@"当前显示view 的角标 -- --   %ld",(long)self.index);
    
    
    //这里高度 - 64  
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor yellowColor];
    view.frame = CGRectMake(0, self.view.frame.size.height - 100 - 64, 100, 100);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
