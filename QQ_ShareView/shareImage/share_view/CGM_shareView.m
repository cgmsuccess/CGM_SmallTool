//
//  CGM_shareView.m
//  QQ_ShareView
//
//  Created by apple on 17/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CGM_shareView.h"
#import "CGM_shareCell.h"

#define CustomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define KWidth [UIScreen mainScreen].bounds.size.width

static CGFloat bgViewHeith = 160; //显示白色界面父视图高度
static CGFloat cancleHeight = 44 ; //取消按钮高度
static CGFloat animationTime = 0.25; //动画时间。从下面移动到上面

@interface CGM_shareView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *bgView;              /** 背景view */

@property (nonatomic, strong) UIButton *cancleBtn;              /** 取消view */

@property (nonatomic, strong) NSArray *titlrArr ;

@property (nonatomic, strong) NSArray *imageArr ;

@property(nonatomic,strong)UICollectionView *collectionView;


@end

@implementation CGM_shareView

-(instancetype)initWithTitle:(NSArray *)titleAlrr AndWithImage:(NSArray *)imageArr{
    self = [super init];
    if (self) {
        self.titlrArr = titleAlrr ;
        self.imageArr = imageArr ;
        [self initSubViewUI]; //初始化UI
    }
    return self;
}

- (void)initSubViewUI{
    
    UIWindow *windowView = [UIApplication sharedApplication].delegate.window;
    
    self.frame = [UIApplication sharedApplication].keyWindow.bounds;
    
    [windowView addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    [self addSubview:self.bgView]; //白色底图父视图
    
    [self fuzzy];

    [self.bgView addSubview:self.cancleBtn];  //取消按钮
    
    [self colletionUI];
    
    [self showPickView]; //显示

}

//毛玻璃
-(void)fuzzy{
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *view = [[UIVisualEffectView alloc]initWithEffect:beffect];
    
    view.frame = self.bgView.bounds;
    
    [self.bgView addSubview:view];
}

#pragma mark - UI

- (UIView *)bgView{
    if (!_bgView) {
        //初始化设置在屏幕之外
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, bgViewHeith)];
        //_bgView.backgroundColor = CustomColor(239, 239, 239, 1.0f);
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];;
    }
    return _bgView;
}

- (UIButton *)cancleBtn{
    if (!_cancleBtn) {
        _cancleBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn.frame=CGRectMake(0, self.bgView.frame.size.height-cancleHeight, self.frame.size.width, cancleHeight);
        _cancleBtn.layer.borderWidth = 0.5;
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancleBtn.layer.borderColor = [UIColor grayColor].CGColor;
        [_cancleBtn addTarget:self action:@selector(cancleAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}

-(void)colletionUI{
    //此处必须要有创见一个UICollectionViewFlowLayout的对象
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = (KWidth-280)/5;
    //最小两行之间的间距
    layout.minimumLineSpacing = 10;
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width , 100) collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    //这个是横向滑动
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    [self.bgView addSubview:_collectionView];
    
    //这种是xib建的cell 需要这么注册
    UINib *cellNib=[UINib nibWithNibName:@"CGM_shareCell" bundle:nil];
    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CGM_shareCell"];
    
    _collectionView.showsHorizontalScrollIndicator = NO ;
}

//取消
-(void)cancleAction{
    [self hidePickView];
}


#pragma mark private methods  私有方法
//显示
- (void)showPickView{
    [UIView animateWithDuration:animationTime animations:^{
        self.bgView.frame = CGRectMake(0, self.frame.size.height - bgViewHeith, self.frame.size.width, bgViewHeith);
    } completion:^(BOOL finished) {
        
    }];
}

//隐藏
- (void)hidePickView{
    [UIView animateWithDuration:animationTime animations:^{
        self.bgView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, bgViewHeith);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches.anyObject.view isKindOfClass:[self class]]) {
        [self hidePickView];
    }
}


#pragma mark UIcollectionDelegate
//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titlrArr.count;
}
//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGM_shareCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CGM_shareCell" forIndexPath:indexPath];

    return cell;
}

//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 100);
}

//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (KWidth - 280)/5, 0, (KWidth - 280)/5);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titleString = self.titlrArr[indexPath.row];
    self.selectBlock(titleString);
    [self hidePickView];
}

@end
