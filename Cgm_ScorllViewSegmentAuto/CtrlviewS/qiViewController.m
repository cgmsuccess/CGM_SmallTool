//
//  qiViewController.m
//  Cgm_ScorllViewSegment
//
//  Created by admin on 16/7/31.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "qiViewController.h"

@interface qiViewController ()

@end

@implementation qiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
