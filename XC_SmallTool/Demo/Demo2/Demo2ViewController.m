//
//  Demo2ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/12.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo2ViewController.h"
#import "CGM_ViewControllerSegment.h"
#import "Demo1subViewController.h"
@interface Demo2ViewController ()

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"分段选择,标签栏等分" ;
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
    NSArray *titleArr = @[@"东邪",@"西毒",@"南帝",@"北丐",@"南帝",@"北丐"];
    NSMutableArray *ctrlArr = [NSMutableArray array];
    NSInteger i = 0 ;
    for (NSString *title in titleArr) {
        Demo1subViewController *demo1Ctrl = [[Demo1subViewController alloc] init];
        demo1Ctrl.title = title;
        demo1Ctrl.index = i ;
        [ctrlArr addObject:demo1Ctrl];
        i ++ ;
    }
    
    
    CGM_ViewControllerSegment *_cgm_ctrl = [[CGM_ViewControllerSegment alloc] initWithCtrltitle:ctrlArr];
    _cgm_ctrl.view.backgroundColor = [UIColor whiteColor];
    _cgm_ctrl.titleScrollviewBackColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7f];
    _cgm_ctrl.sliderBackColor= [UIColor redColor]; //滑块颜色
    
    _cgm_ctrl.btnNormolColor = [UIColor blueColor]; //正常时的颜色
    _cgm_ctrl.btnSlectColor =  [UIColor redColor]; //选中时的颜色
    
    [self addChildViewController:_cgm_ctrl];  //不可缺少重要
    _cgm_ctrl.view.frame=CGRectMake(0, kNavbarHeight, KmainScreenWidth,KmainScreenHeiht -kNavbarHeight);
    [self.view addSubview:_cgm_ctrl.view];
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
