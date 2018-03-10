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
@interface CGM_ViewControllerSegment ()<UIScrollViewDelegate>
{
    UIButton *lastBtn;  //上一次选中的btn
    UIView *backView;  //滑块
    CGFloat btnwidth; //button宽度
    UILabel *underline;//下划线
}
@property (nonatomic,strong)NSArray *CtrlArr;

@property (nonatomic,strong)XCScrollView *titleScrollview;

@property (nonatomic,strong)XCScrollView *CtrlScroollview;

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
    
    [self scrollViewDidEndScrollingAnimation: self.CtrlScroollview ];

    //指定的偏移量
    if (self.ScorllviewIndex != 0) {
        
        CGPoint offset = self.CtrlScroollview.contentOffset;
        offset.x = self.ScorllviewIndex * CGMScreenWidth;
        [self.CtrlScroollview setContentOffset:offset animated:YES];
    }
    
}

- (void)addChildViewControllers {
    if (_titleHeight!=0) {
        self.CtrlScroollview=[[XCScrollView alloc] initWithFrame:CGRectMake(0, _titleHeight,CGMScreenWidth, CGMScreenHight-_titleHeight - 64)];
        //scorllview 容器宽度
        self.CtrlScroollview.contentSize = CGSizeMake(self.CtrlArr.count * CGMScreenWidth , CGMScreenHight-_titleHeight - 64 );
    }else{
    self.CtrlScroollview=[[XCScrollView alloc] initWithFrame:CGRectMake(0, 44,CGMScreenWidth, CGMScreenHight-44 - 64)];
    //scorllview 容器宽度
    self.CtrlScroollview.contentSize = CGSizeMake(self.CtrlArr.count * CGMScreenWidth , CGMScreenHight-44 - 64);
        
    }
    
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
    if (_titleHeight) {
      self.titleScrollview = [[XCScrollView alloc] initWithFrame:CGRectMake(0, 0, CGMScreenWidth, _titleHeight)];
    }else{
        self.titleScrollview = [[XCScrollView alloc] initWithFrame:CGRectMake(0, 0, CGMScreenWidth, 44)];
    }
    
    [self.view addSubview:self.titleScrollview];
    if (_titleHeight) {
        underline=[[UILabel alloc]initWithFrame:CGRectMake(0, _titleHeight-0.3, KmainScreenWidth, 0.3)];
    }else{
        underline=[[UILabel alloc]initWithFrame:CGRectMake(0, 44-0.3, KmainScreenWidth, 0.3)];
    }
    [self.view addSubview:underline];
    underline.backgroundColor=[UIColor blackColor];
    [self.view addSubview:underline];
    
    if (_titleScrollviewBackColor) {
        self.titleScrollview.backgroundColor =_titleScrollviewBackColor;
    }else{
        self.titleScrollview.backgroundColor=[UIColor blackColor];
    }
    
    self.titleScrollview.userInteractionEnabled =YES;
    
    if (self.CtrlArr.count<5) {
        btnwidth = CGMScreenWidth/self.CtrlArr.count;
    }else{
         btnwidth = CGMScreenWidth/4;
    }
    
    backView=[[UIView alloc] init];
    if (_titleHeight!=0) {
        backView.frame=CGRectMake(0, _titleHeight-3, btnwidth, 3);
    }else{
        backView.frame=CGRectMake(0, 41, btnwidth, 3);
    }
    if (_sliderBackColor) {
        backView.backgroundColor =_sliderBackColor;

    }else{
    backView.backgroundColor =[UIColor greenColor];
    }
    
    
    for (int i = 0; i<self.childViewControllers.count; i++) {
        
            UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[self.childViewControllers[i] title] forState:UIControlStateNormal];
        if (_btnNormolColor) {
            [button setTitleColor:_btnNormolColor forState:UIControlStateNormal];

        }else{
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        if (_titleHeight!=0) {
            button.frame=CGRectMake(btnwidth*i, 0, btnwidth, _titleHeight);
        }else{
            button.frame=CGRectMake(btnwidth*i, 0, btnwidth, 41);
        }
            button.tag =10000+i;
            [button addTarget:self action:@selector(cilckBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.titleScrollview addSubview:button];
            if (i == 0) {
                button.selected = YES;
                if (_btnSlectColor) {
                    [button setTitleColor:_btnSlectColor forState:UIControlStateNormal];
                }else{
                    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                }
                lastBtn = button;
            }
        }
    [self.titleScrollview addSubview:backView];

    if (_titleHeight!=0) {
        self.titleScrollview.contentSize=CGSizeMake(btnwidth*self.childViewControllers.count, _titleHeight);
    }else{
        self.titleScrollview.contentSize=CGSizeMake(btnwidth*self.childViewControllers.count, 44);
    }

}

-(void)cilckBtn:(UIButton *)btn{
    UIButton *button = [self.titleScrollview viewWithTag:btn.tag];
    lastBtn.selected = NO;
    if (_btnNormolColor) {
        [lastBtn setTitleColor:_btnNormolColor forState:UIControlStateNormal];
        
    }else{
        [lastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    button.selected = YES;
    if (_btnSlectColor) {
        [button setTitleColor:_btnSlectColor forState:UIControlStateNormal];
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
    
//    if (_ScorllviewIndex) {
//         self.CtrlScroollview.contentOffset=CGPointMake(CGMScreenWidth*_ScorllviewIndex, CGMScreenHight-44);
//    }
    
    // 一些临时变量
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;
    // 当前控制器需要显示的控制器的索引
    NSInteger index = offsetX / width;
    
    // 让对应的顶部标题居中显示
    UIButton *button = self.titleScrollview.subviews[index];
    
    if (_titleHeight!=0) {
        [UIView animateWithDuration:0.3f animations:^{
            backView.frame=CGRectMake(btnwidth*index, _titleHeight-3, btnwidth, 3);
        }];
    }else{
    [UIView animateWithDuration:0.3f animations:^{
        backView.frame=CGRectMake(btnwidth*index, 41, btnwidth, 3);
    }];
    }
    
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

    CGPoint titleOffsetX = self.titleScrollview.contentOffset;
    titleOffsetX.x = button.center.x - width/2;
    // 左边偏移量边界
    if(titleOffsetX.x < 0) {
        titleOffsetX.x = 0;
    }
    
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
//    [self scrollViewDidEndScrollingAnimation:scrollView]; //上面title和ctrl保持一致
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
