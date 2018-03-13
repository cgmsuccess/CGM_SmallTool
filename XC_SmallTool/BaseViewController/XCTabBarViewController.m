//
//  XCViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/12.
//  Copyright © 2018年 gao bin. All rights reserved.

#import "XCTabBarViewController.h"
#import "XCBaseViewController.h"
#import "XCNavigationViewController.h"
@interface XCTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation XCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTabBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

-(void)createTabBar
{
    NSMutableArray *viewControllers = [NSMutableArray array];
    NSArray *ctrlArr = @[@"ViewController",@"SecondViewController",@"ThreeViewController"];
    NSArray *defaultImageArr = @[@"tab0",@"tab1",@"tab2"];
    NSArray *selectImageArr = @[@"tab0on",@"tab1on",@"tab2on"];
    NSArray *ctrlTitle = @[@"首页",@"第二页",@"第三页"];
    
    int i = 0 ;
    for (NSString *ctrlString in ctrlArr) {
        
        XCBaseViewController  *aVC = (XCBaseViewController *) [[NSClassFromString(ctrlString) alloc]init];
        XCNavigationViewController *nav=[[XCNavigationViewController alloc]initWithRootViewController:aVC];
        
        UITabBarItem *tabItem=[[UITabBarItem alloc]initWithTitle:ctrlTitle[i] image:[[UIImage imageNamed:defaultImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        aVC.title = ctrlTitle[i];
        nav.tabBarItem = tabItem;
        [viewControllers addObject:nav];
        i++ ;
    }
    self.viewControllers = viewControllers;
    self.tabBar.tintColor = [UIColor redColor];
    
    self.delegate = self;
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    XCLog(@" 点击了角标 %ld ",(unsigned long)self.selectedIndex );
}


#pragma mark 这里可以设置某个页面可以旋转
- (BOOL)shouldAutorotate
{
//    BaseNavigationController *nav = (BaseNavigationController *)self.selectedViewController;
//    if ([nav.visibleViewController isKindOfClass:[NSClassFromString(@"MessageViewController") class]])
//    {
//        return YES;
//    }
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
//    BaseNavigationController *nav = (BaseNavigationController *)self.selectedViewController;
//    //    topViewController = nav.lastObj
//    if ([nav.visibleViewController isKindOfClass:[NSClassFromString(@"MessageViewController") class]])
//    {
//        return UIInterfaceOrientationMaskAllButUpsideDown;
//    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
//    BaseNavigationController *nav = (BaseNavigationController *)self.selectedViewController;
//    if ([nav.visibleViewController isKindOfClass:[NSClassFromString(@"MessageViewController") class]])
//    {
//        return UIInterfaceOrientationLandscapeLeft;
//    }
    return UIInterfaceOrientationPortrait;
}


@end
