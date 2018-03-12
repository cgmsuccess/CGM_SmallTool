//
//  Demo1ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/10.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo1ViewController.h"
#import "CGM_ViewControllerAutoSegment.h"
#import "Demo1subViewController.h"

@interface Demo1ViewController ()

@property (nonatomic,weak)CGM_ViewControllerAutoSegment *cgm_ctrl ;//分段控制器


@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"分段控制器标签自适应";
    self.automaticallyAdjustsScrollViewInsets = NO ; //取消偏移
    NSArray *titleArr = @[@"东邪",@"西毒",@"南帝",@"北丐",@"中神通",@"神雕英雄传",@"笑傲江湖",@"桃谷六仙",@"神雕侠侣",@"老顽童",@"周伯通"];
    NSMutableArray *ctrlArr = [NSMutableArray array]; //装控制器
    
    //Demo1subViewController  即我们的控制器。如果里面布局一样，但是数据源不一样，可以给每个控制器加属性，做区分，也可以创建多个控制器。加载到数组里面。 分段控制器，会给他们分配位置进行展示
    NSInteger i = 0 ;
    for (NSString *titile  in titleArr) {
        Demo1subViewController *demo1subCtrl = [[Demo1subViewController alloc] init];
        demo1subCtrl.title = titile ;
        demo1subCtrl.index = i ;
        [ctrlArr addObject:demo1subCtrl];
        i++ ;
    }
    
    CGM_ViewControllerAutoSegment *segmentCtrl = [[CGM_ViewControllerAutoSegment alloc] initWithCtrltitle:ctrlArr];;
    segmentCtrl.view.backgroundColor = [UIColor whiteColor];
    _cgm_ctrl = segmentCtrl ;
    _cgm_ctrl.view.frame=CGRectMake(0, kNavbarHeight, KmainScreenWidth,KmainScreenHeiht - kNavbarHeight);

    _cgm_ctrl.sliderBackColor= [UIColor redColor];  //滑块默认颜色
    _cgm_ctrl.btnNormolColor = [UIColor blueColor]; //btn正常时的颜色
    _cgm_ctrl.btnSlectColor = [UIColor orangeColor]; //btn选中时的颜色
    _cgm_ctrl.ScorllviewIndex = 3;  //默认第4个控制器
    
    [self addChildViewController:_cgm_ctrl];  //不可缺少重要
    [self.view addSubview:_cgm_ctrl.view];
    
}


-(void)cilckback
{
    [self.navigationController popViewControllerAnimated:YES];
    XCLog(@"xx-x-x-cilckback  ");
}

-(void)cilckMore
{
    XCLog(@"xx-x-x-  cilckMore ")
}



-(void)dealloc
{
    XCLog(@" dealloc = %@" ,NSStringFromClass([self class]));
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
