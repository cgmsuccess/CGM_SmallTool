//
//  ViewController.m
//  Cgm_ScorllViewSegment
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "ViewController.h"
#import "CGM_ViewControllerSegment.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "qiViewController.h"
#import "baViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    OneViewController *one = [[OneViewController alloc]init];
    one.title = @"西毒";
    TwoViewController *two = [[TwoViewController alloc]init];
    two.title = @"东邪,东邪,东邪,东邪";
    ThreeViewController *three = [[ThreeViewController alloc]init];
    three.title = @"我就是";
    FourViewController *four = [[FourViewController alloc]init];
    four.title = @"哈哈哈哈";
    FiveViewController *five = [[FiveViewController alloc]init];
    five.title = @"南帝";
    SixViewController *six = [[SixViewController alloc]init];
    six.title = @"北丐";
    qiViewController *qi =[[qiViewController alloc] init];
    qi.title=@"中神通";
    baViewController *ba =[baViewController new];
    ba.title = @"英菇";
    TwoViewController *jiu = [[TwoViewController alloc]init];
    jiu.title = @"东邪";
    
    NSArray *subViewControllers = @[one,two,three,four,six,jiu,ba,ba,five];
    
    CGM_ViewControllerSegment *cgm_ctrl=[[CGM_ViewControllerSegment alloc] initWithCtrltitle:subViewControllers];
  //  cgm_ctrl.ScorllviewIndex = 3;
    cgm_ctrl.sliderBackColor=[UIColor yellowColor];
    cgm_ctrl.titleScrollviewBackColor=[UIColor grayColor];
    [self addChildViewController:cgm_ctrl];  //不可缺少重要
    cgm_ctrl.view.frame=CGRectMake(0, 64, 375,667-64);
    [self.view addSubview:cgm_ctrl.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
