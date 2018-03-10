//
//  CGM_ViewControllerSegment.m
//  Cgm_ScorllViewSegment
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "CGM_ViewControllerAutoSegment.h"
#import "NSString+Helper.h"
#import "XCScrollView.h"
#define CGMScreenWidth    [UIScreen mainScreen].bounds.size.width
#define CGMScreenHight    [UIScreen mainScreen].bounds.size.height
#define TitleScroviewAlpan 0.7f  //透明度

@interface CGM_ViewControllerAutoSegment ()<UIScrollViewDelegate>
{
    UIButton *lastBtn;  //上一次选中的btn
    
    CGFloat btnwidth; //总宽度低于屏幕物理宽度时,标题btn宽度
}
@property (nonatomic,strong)NSArray *CtrlArr;

@property (nonatomic,weak)XCScrollView *titleScrollview;

@property (nonatomic,weak)XCScrollView *CtrlScroollview;

@property (nonatomic,weak)UIView *toolsView ;  //下划线

@property (nonatomic,weak)UIView *backView;  //滑块

@end

@implementation CGM_ViewControllerAutoSegment


-(NSArray *)CtrlArr{
    if (!_CtrlArr) {
        _CtrlArr=[NSMutableArray new];
    }
    return _CtrlArr;
}

-(instancetype)initWithCtrltitle:(NSArray *)viewCtrl{
    if (self = [super init]) {
        self.CtrlArr = viewCtrl ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addChildViewControllers];//添加控制器
    [self NewCreateScorllview];  //添加标题
    self.CtrlScroollview.scrollsToTop = NO ;
    self.titleScrollview.scrollsToTop = NO ;
}

/**  添加控制器  */
- (void)addChildViewControllers {
    XCScrollView *ctrlScrollview = [[XCScrollView alloc] init];
    self.CtrlScroollview = ctrlScrollview;
    //scorllview 容器宽度
    self.CtrlScroollview.delegate =self;
    self.CtrlScroollview.pagingEnabled = YES;
    self.CtrlScroollview.bounces = NO;
    [self.view addSubview:self.CtrlScroollview];
 
    for (int i= 0; i<self.CtrlArr.count; i++) {
        UIViewController *vc =self.CtrlArr[i];
        [self addChildViewController:vc];
    }
}

/**  布局   */
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    /** 容器布局   */
    self.CtrlScroollview.frame = CGRectMake(0,0,CGMScreenWidth, CGMScreenHight-44) ;
    self.CtrlScroollview.contentSize = CGSizeMake(self.CtrlArr.count * CGMScreenWidth , CGMScreenHight-44);
    
    /**   滑块布局  */
    _toolsView.frame = CGRectMake(0, 43.5, CGMScreenWidth, 0.5);
    self.titleScrollview.frame = CGRectMake(0, 0, CGMScreenWidth, 44);
    
    /**  标签布局   */
    CGFloat Zwidth = 0;  //每个btn宽度的总长
    CGFloat Fwidth;  //每个btn的frame
    int i = 0 ;
    //获取所有button
    for (UIView *titleScrollview in self.titleScrollview.subviews) {
        if ([[titleScrollview class] isEqual:[UIButton class]]) {
           UIButton *subBtn = (UIButton *)titleScrollview;
            if (_btnNormolColor) {
                [subBtn setTitleColor:_btnNormolColor forState:UIControlStateNormal];
            }
            
            //每个btn宽度
            CGFloat f=  [NSString autoWidthWithString:[self.childViewControllers[i] title]  Font:BtnFont]+10;
            Zwidth +=f;  //总宽度
            Fwidth =Zwidth-f; //frame 宽度
            subBtn.frame=CGRectMake(Fwidth, 0, f, 41);
            subBtn.tag =10000+i;
            [subBtn addTarget:self action:@selector(cilckBtn:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                subBtn.selected = YES;
                if (_btnSlectColor) {
                    [subBtn setTitleColor:_btnSlectColor forState:UIControlStateNormal];
                }else{
                    [subBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                }
                lastBtn = subBtn;
            }
            i++ ;
        }
    }
    //计算出来的总宽度小于屏幕宽度时，每个btn宽度
    if (Zwidth<CGMScreenWidth) {
        btnwidth =CGMScreenWidth/self.childViewControllers.count;
    }
    [self.titleScrollview addSubview:self.backView];
    [self.view addSubview:self.toolsView];
    if (Zwidth<CGMScreenWidth) {
        //titlteBtn 居中显示
        self.titleScrollview.contentSize =CGSizeMake((CGMScreenWidth-Zwidth)/2+Zwidth,44);
    }else{
        self.titleScrollview.contentSize=CGSizeMake(Zwidth, 44);
    }
    
    
    
    
    
    //默认偏移
    [self scrollViewDidEndScrollingAnimation: self.CtrlScroollview ];
    //指定的偏移量
    if (self.ScorllviewIndex != 0) {
        CGPoint offset = self.CtrlScroollview.contentOffset;
        offset.x = self.ScorllviewIndex * CGMScreenWidth;
        [self.CtrlScroollview setContentOffset:offset animated:YES];
    }
}

/**  设置滑块颜色   */
-(void)setSliderBackColor:(UIColor *)sliderBackColor
{
    _sliderBackColor = sliderBackColor;
    self.backView.backgroundColor =_sliderBackColor;
}

/**   定义标题栏背景色  */
-(void)setTitleScrollviewBackColor:(UIColor *)titleScrollviewBackColor
{
    _titleScrollviewBackColor = titleScrollviewBackColor ;
    self.titleScrollview.backgroundColor =_titleScrollviewBackColor;
}

/**  默认选中时的颜色   */
-(void)setBtnSlectColor:(UIColor *)btnSlectColor
{
    _btnSlectColor = btnSlectColor;
}

/**  默认未选中的颜色  */
-(void)setBtnNormolColor:(UIColor *)btnNormolColor
{
    _btnSlectColor = btnNormolColor ;
}


/**   创建标签栏  */
-(void)NewCreateScorllview{
   // XCScrollView 避免和滑动手势冲突
    XCScrollView *titleScorllview  = [[XCScrollView alloc] init];
    self.titleScrollview = titleScorllview ;
    [self.view addSubview:self.titleScrollview];
   
    //下划线
    UIView *lineView = [UIView new];
    _toolsView = lineView ;
    _toolsView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4f];
    
    self.titleScrollview.backgroundColor=[UIColor blackColor];
    self.titleScrollview.userInteractionEnabled =YES;
    [self.titleScrollview setShowsVerticalScrollIndicator:NO];
    [self.titleScrollview setShowsHorizontalScrollIndicator:NO];
    
    self.titleScrollview.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:TitleScroviewAlpan];
    UIView *sliderview = [UIView new];
    self.backView = sliderview ;
    self.backView.frame=CGRectMake(0, 41, btnwidth, 3);
    self.backView.backgroundColor =[UIColor greenColor];
    [self.titleScrollview addSubview:sliderview];

    for (int i = 0; i<self.childViewControllers.count; i++) {
            UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[self.childViewControllers[i] title] forState:UIControlStateNormal];
            button.titleLabel.font =[UIFont systemFontOfSize:BtnFont];
            [self.titleScrollview addSubview:button];
        }
}

/**   点击按钮。偏移  */
-(void)cilckBtn:(UIButton *)btn{
    UIButton *button = [self.titleScrollview viewWithTag:btn.tag];
    lastBtn.selected = NO;
    
    if (self.btnNormolColor) { //if 设置了默认btn 颜色
        [lastBtn setTitleColor:self.btnNormolColor forState:UIControlStateNormal];
    }else{
        [lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    button.selected = YES;
    if (self.btnSlectColor) {
        [button setTitleColor:self.btnSlectColor forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    lastBtn = button;
    NSInteger index = btn.tag-10000;
    // 定位到指定位置
    CGPoint offset = self.CtrlScroollview.contentOffset;
    offset.x = index * CGMScreenWidth;
    [self.CtrlScroollview setContentOffset:offset animated:YES];
}

#pragma mark UIScrollviewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    //这里是默认进入那个控制器
    XCLog(@"x_ScorllviewIndex = %lu" ,(long)_ScorllviewIndex) ;
    // 一些临时变量
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    // 当前控制器需要显示的控制器的索引
    NSInteger index = offsetX / width;
    
    // 让对应的顶部标题居中显示
    UIButton *button = self.titleScrollview.subviews[index];

    XCLog(@"---%@--",NSStringFromClass(button.class));
    //滑块位置
    CGRect rect  =  CGRectMake(button.frame.origin.x, button.frame.origin.y+42, button.frame.size.width, 3) ;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.backView.frame=rect;
    }];
    
    lastBtn.selected = NO;
    if (_btnNormolColor) {
        [lastBtn setTitleColor:_btnNormolColor forState:UIControlStateNormal];
    }else{
        [lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (![button isKindOfClass:[UIButton class]]) {
        return;
    }
    
    button.selected = YES;
    if (_btnSlectColor) {
        [button setTitleColor:_btnSlectColor forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    
    lastBtn = button;
    //偏移量
    CGPoint titleOffsetX = self.titleScrollview.contentOffset;
    // titleScrllView 的偏移量 ，是上面标题的偏移量，前面几次移动，scrollview 的偏移量，他的值的变化规律是 titleOffsetX = {0, 0}
    //titleOffsetX = {0, 0}
    //titleOffsetX = {50.5, 0}
    //titleOffsetX = {121.5, 0}
    //titleOffsetX = {152, 0}
   // SGLog(@"titleOffsetX = %@" , NSStringFromCGPoint(titleOffsetX));

    //button.center.x = 22.323000 ,width/2 = 187.500000
    // button.center.x = 125.923107 ,width/2 = 187.500000
    //button.center.x = 238.184715 ,width/2 = 187.500000
    // button.center.x = 308.815215 ,width/2 = 187.500000
    //button.center.x = 370.784215 ,width/2 = 187.500000
    // button.center.x = 415.430215 ,width/2 = 187.500000
    XCLog(@"button.center.x = %lf ,width/2 = %lf " ,button.center.x , width/2) ;
    titleOffsetX.x = button.center.x - width/2; //这里是偏移移动，titlescorllview随着滑动移动，这里就是始终居中 - width/2
    // 左边偏移量边界
    if(titleOffsetX.x < 0) {
        titleOffsetX.x = 0;
    }
    //最大偏移， 避免最右边空出一大部分
    CGFloat maxOffsetX = self.titleScrollview.contentSize.width - width;
    // 右边偏移量边界
    if(titleOffsetX.x > maxOffsetX) {
        titleOffsetX.x = maxOffsetX;
    }
    // 修改偏移量
    self.titleScrollview.contentOffset = titleOffsetX;
    // 取出需要显示的控制器
    UIViewController *willShowVc = self.childViewControllers[index];
    // 如果当前位置的控制器已经显示过了，就直接返回，不需要重复添加控制器的view
    if([willShowVc isViewLoaded]) return;
#pragma makr  控制器就是通过这里进行的显示
    // 如果你没有显示过，则将控制器的view添加到contentScrollView上
    willShowVc.view.frame = CGRectMake(index * width, 0, width, height);
    
    [scrollView addSubview:willShowVc.view];
}

/**
 *  当手指抬起停止减速的时候会调用这个方法,
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView]; //加载ctrl
}

// 将要减速
//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//   
//    //[self scrollViewDidEndScrollingAnimation:scrollView]; //上面title和ctrl保持一致
//
//}

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
