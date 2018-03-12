//
//  CGM_ViewControllerSegment.m
//  Cgm_ScorllViewSegment
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "CGM_ViewControllerSegment.h"
#import "XCScrollView.h"
#define CGMScreenWidth    [UIScreen mainScreen].bounds.size.width
#define CGMScreenHight    [UIScreen mainScreen].bounds.size.height

#define  tagHeight  44   // 标签栏高度

@interface CGM_ViewControllerSegment ()<UIScrollViewDelegate>
{
    UIButton *lastBtn;  //上一次选中的btn
    CGFloat btnwidth; //button宽度
    UILabel *underline;//下划线
}
@property (nonatomic,strong)NSArray *CtrlArr;

@property (nonatomic,strong)XCScrollView *titleScrollview;

@property (nonatomic,strong)XCScrollView *CtrlScroollview;

/**      滑块    ****/
@property (nonatomic,strong)UIView *sliderView;

@end

@implementation CGM_ViewControllerSegment



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

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //内容容器布局
    self.CtrlScroollview.frame = CGRectMake(0, 0,CGMScreenWidth, CGMScreenHight - tagHeight);
    self.CtrlScroollview.contentSize = CGSizeMake(self.CtrlArr.count * CGMScreenWidth , CGMScreenHight - tagHeight );

    //标签容器布局
    self.titleScrollview.frame = CGRectMake(0, 0, CGMScreenWidth, tagHeight);
    self.titleScrollview.contentSize=CGSizeMake(btnwidth * self.CtrlArr.count, tagHeight);

    /**   滑块布局  */
    _sliderView.frame = CGRectMake(0, tagHeight - 3, btnwidth, 3);
    
    /**  标签栏布局   */
    self.titleScrollview.frame = CGRectMake(0, 0, CGMScreenWidth, tagHeight);
    
    /**  标签下划线布局   */
    underline.frame = CGRectMake(0, tagHeight - 0.3, KmainScreenWidth, 0.3);
    
    
    int i = 0 ;
    //获取所有button
    for (UIView *titleScrollview in self.titleScrollview.subviews) {
        if ([[titleScrollview class] isEqual:[UIButton class]]) {
            UIButton *button = (UIButton *)titleScrollview;
         
            if (_btnNormolColor) {
                [button setTitleColor:_btnNormolColor forState:UIControlStateNormal];
            }else{
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            
            button.frame=CGRectMake(btnwidth * i, 0, btnwidth, tagHeight - 3);
            button.tag =10000+i;
            [button addTarget:self action:@selector(cilckBtn:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                button.selected = YES;
                if (_btnSlectColor) {
                    [button setTitleColor:_btnSlectColor forState:UIControlStateNormal];
                }else{
                    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                }
                lastBtn = button;
            }
            i++ ;
        }
    }
    
    /**  偏移量   */
    [self scrollViewDidEndScrollingAnimation: self.CtrlScroollview ];
    //指定的偏移量
    if (self.ScorllviewIndex != 0) {
        CGPoint offset = self.CtrlScroollview.contentOffset;
        offset.x = self.ScorllviewIndex * CGMScreenWidth;
        [self.CtrlScroollview setContentOffset:offset animated:YES];
    }
    
}

- (void)addChildViewControllers {
    self.CtrlScroollview=[[XCScrollView alloc] init];
    
    self.CtrlScroollview.delegate =self;
    self.CtrlScroollview.pagingEnabled = YES;
    self.CtrlScroollview.bounces = NO;
    
    [self.view addSubview:self.CtrlScroollview];
    for (int i= 0; i<self.CtrlArr.count; i++) {
        UIViewController *vc =self.CtrlArr[i];
        [self addChildViewController:vc];
    }
}

-(void)NewCreateScorllview{
    
    /**  标签容器   */
    self.titleScrollview = [[XCScrollView alloc] init];
    [self.view addSubview:self.titleScrollview];
    
    /**  标签容器的下划线   */
    underline=[[UILabel alloc] init];
    underline.backgroundColor=[UIColor blackColor];
    [self.view addSubview:underline];
    

    self.titleScrollview.backgroundColor=[UIColor blackColor];
    self.titleScrollview.userInteractionEnabled =YES;

 
    /**  滑块   */
    _sliderView =[[UIView alloc] init];
   
    //滑块颜色
    
    _sliderView.backgroundColor =[UIColor greenColor];
    
    if (self.CtrlArr.count<5) {
        btnwidth = CGMScreenWidth/self.CtrlArr.count;
    }else{
        btnwidth = CGMScreenWidth/4;
    }
    for (int i = 0; i<self.childViewControllers.count; i++) {
        
            UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[self.childViewControllers[i] title] forState:UIControlStateNormal];
        [self.titleScrollview addSubview:button];

    
        }
    [self.titleScrollview addSubview:_sliderView];
}

/**  滑块的颜色   */
-(void)setSliderBackColor:(UIColor *)sliderBackColor
{
    _sliderBackColor = sliderBackColor ;
    self.sliderView.backgroundColor = sliderBackColor;
}

/**  标签栏颜色   */
-(void)setTitleScrollviewBackColor:(UIColor *)titleScrollviewBackColor
{
    _titleScrollviewBackColor = titleScrollviewBackColor;
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
    _btnNormolColor = btnNormolColor ;
}




/**  标签选择   */
-(void)cilckBtn:(UIButton *)btn{
    UIButton *button = [self.titleScrollview viewWithTag:btn.tag];
    lastBtn.selected = NO;
    if (self.btnNormolColor) {
        [lastBtn setTitleColor:self.btnNormolColor forState:UIControlStateNormal];
        
    }else{
        [lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
    

    // 一些临时变量
    CGFloat width = scrollView.frame.size.width;  //屏幕宽度
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    // 当前控制器需要显示的控制器的索引
    NSInteger index = offsetX / width;
    
    // 让对应的顶部标题居中显示
    UIButton *button = self.titleScrollview.subviews[index];
    //滑块位置
    CGRect rect  =  CGRectMake(button.frame.origin.x, button.frame.size.height, button.frame.size.width, 3) ;

    [UIView animateWithDuration:0.3f animations:^{
        _sliderView.frame = rect;
    }];
    
    
    lastBtn.selected = NO;
   
    if (self.btnNormolColor) {
        [lastBtn setTitleColor:self.btnNormolColor forState:UIControlStateNormal];
    }else{
        [lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (![button isKindOfClass:[UIButton class]]) {
        return;
    }
    button.selected = YES;
    
    if (self.btnSlectColor) {
        [button setTitleColor:self.btnSlectColor forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    }
    lastBtn = button;

    CGPoint titleOffsetX = self.titleScrollview.contentOffset;
    //按钮位置是否超过了屏幕的中间
    titleOffsetX.x = button.center.x - width/2;
    // 左边偏移量边界
    if(titleOffsetX.x < 0) {
        titleOffsetX.x = 0;
    }
    
    //最大可偏移量
    CGFloat maxOffsetX = self.titleScrollview.contentSize.width - width;
    // 右边偏移量边界
    if(titleOffsetX.x > maxOffsetX) {
        titleOffsetX.x = maxOffsetX;
    }
    
    // 修改偏移量
    [self.titleScrollview  setContentOffset:titleOffsetX animated:YES];

//    self.titleScrollview.contentOffset = titleOffsetX;
    
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
