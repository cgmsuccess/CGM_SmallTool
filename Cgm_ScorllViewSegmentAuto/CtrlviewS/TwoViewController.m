//
//  TwoViewController.m
//  父子控制器
//
//  Created by 戴川 on 16/6/3.
//  Copyright © 2016年 戴川. All rights reserved.
//

#import "TwoViewController.h"

@implementation TwoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.text = @"two";
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor yellowColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
