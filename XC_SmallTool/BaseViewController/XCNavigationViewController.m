//
//  XCNavigationViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/12.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "XCNavigationViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "XCBaseViewController.h"
@interface XCNavigationViewController ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIPanGestureRecognizer *pan;

@end

@implementation XCNavigationViewController



+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    
    
//
//    //*************设置自定义的navagationBar 底部背景图片 *******************//
//    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
//    [navBar setBackgroundImage:[UIImage imageNamed:@"ic_底部背景2"] forBarMetrics:UIBarMetricsDefault];
//    //http://blog.csdn.net/G_eorge/article/details/51144017  擦嘞。不设置 navBar.translucent = YES ;整体view全部下降了 64 个单位,坑死了。 参考如上。
//    navBar.translucent = YES ;
//
//    //可注释点，显示系统自定义
//    //*************设置自定义的navagationBar 底部背景图片 *******************//
//

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:_pan];
    
    // 控制手势什么时候触发,只有非根控制器才需要触发手势
    _pan.delegate = self;
    
    // 禁止之前手势
    self.interactivePopGestureRecognizer.enabled = NO;
}


#pragma mark - UIGestureRecognizerDelegate
//  防止导航控制器只有一个rootViewcontroller时触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    XCBaseViewController *currentVC = (XCBaseViewController *)self.topViewController;
    //解决与左滑手势冲突
    CGPoint translation = [_pan translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
  
    return self.childViewControllers.count == 1 ? NO : YES;
}

// 决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back_highlighted" highImage:@"navigationbar_back"];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more_highlighted" highImage:@"navigationbar_more"];
        
    }
    [super pushViewController:viewController animated:animated];
}



#pragma mark 事件的拦击
/**  返回   */
- (void)back
{
    XCBaseViewController * currentVC = (XCBaseViewController *)self.topViewController;
    if ([currentVC respondsToSelector:@selector(cilckback)]) {
        [currentVC cilckback];
    }else{
        [self popViewControllerAnimated:YES];
    }
}

/**  更多   */
- (void)more
{
    XCBaseViewController * currentVC = (XCBaseViewController *)self.topViewController;
    if ([currentVC respondsToSelector:@selector(cilckMore)]) {
        [currentVC cilckMore];
    }else{
        [self popToRootViewControllerAnimated:YES];
    }
}

#pragma mark 屏幕旋转
// 是否支持自动转屏
- (BOOL)shouldAutorotate
{
    return [self.visibleViewController shouldAutorotate];
}
// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.visibleViewController supportedInterfaceOrientations];
}

// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
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
