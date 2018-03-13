//
//  ThreeViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/12.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "ThreeViewController.h"
#import "XCTabBarViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor ;

    
    
    XCTabBarViewController *tabbr =  (XCTabBarViewController *)[UIApplication  sharedApplication].keyWindow.rootViewController ;
    UITabBarItem * item =[tabbr.tabBar.items objectAtIndex:2];
    item.badgeValue=[NSString stringWithFormat:@"✨"];;
    
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 100, 100 );
    view.center = self.view.center;
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
