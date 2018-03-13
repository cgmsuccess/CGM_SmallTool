//
//  Demo5ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/13.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo5ViewController.h"
#import "CGM_AlertContoller.h"

@interface Demo5ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableVIew;
@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation Demo5ViewController

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(UITableView *)tableVIew
{
    if (!_tableVIew) {
        _tableVIew = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavbarHeight, KmainScreenWidth, KmainScreenHeiht - kNavbarHeight) style:UITableViewStyleGrouped];
        _tableVIew.delegate = self;
        _tableVIew.dataSource = self;
        
        if (@available(iOS 11.0, *)) {
            self.tableVIew.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        self.tableVIew.estimatedRowHeight = 0;
        self.tableVIew.estimatedSectionHeaderHeight = 0;
        self.tableVIew.estimatedSectionFooterHeight = 0;
    }
    return _tableVIew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];

}

-(void)setUI
{
    [self.tableVIew registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.title = @"泡泡";
    for (int i = 1 ; i < 5; i++) {
        NSString *styleString = [NSString stringWithFormat:@"样式 %d",i];
        [self.dataSource addObject:styleString];
    }
    
    [self.view addSubview:self.tableVIew];
}


#pragma mark 泡泡风格
/**   风格1  */
-(void)styleOne
{
    [CGM_AlertContoller alertMesasge:@"请选择" confirmHandler:^(UIAlertAction *No_cancal) {
        
    }];
}


/**   风格2 */
-(void)styleTwo
{
    WS(weakSelf);
    [CGM_AlertContoller alertMesasgeTwoBtn:@"温馨提示：风格2" AndUIAlertControllerStyle:UIAlertControllerStyleActionSheet confirmHandler:^(UIAlertAction *No_cancal) {
        
        XCLog(@"点击了确定");
        
    } AndconfirmActionString:@"确定" cancleHandler:^(UIAlertAction *cancal) {
        
        XCLog(@"点击了取消")
    } AndcancleString:@"取消" ViewContoller:weakSelf] ;
}

/**   风格3  */
-(void)styleThree
{
    
    //导航  ，自定义风格
    UIAlertActionStyle baiduStyle;
    UIAlertActionStyle gaodeStyle;
    NSString *messge ;
    messge = @"检测到你的手机没有安装了百度地图,选择百度地图将会进入网页，建议使用高德地图进行导航";
    baiduStyle = UIAlertActionStyleDefault;
    gaodeStyle = UIAlertActionStyleDestructive ;

    
    [CGM_AlertContoller alertTitle_CustomColor:@"温馨提示" AndIndx_One:@"百度地图导航" Andindex_oneUIAlertActionStyle:baiduStyle AndIndexTwo:@"高德地图导航" Andindex_TwoUIAlertActionStyle:gaodeStyle AndCancle:@"取消" mesasge:messge preferredStyle:UIAlertControllerStyleActionSheet oneIndexHandler:^(UIAlertAction *oneIndex) {

        
    } twoIndexHandler:^(UIAlertAction *twoIndex) {

        
    } cancleHandler:^(UIAlertAction *cancle) {
        
    }];
    
}

/**   风格4  */
-(void)styleFour
{
    [CGM_AlertContoller alertthreeTitle:@"温馨提示" AndIndx_One:@"提示1" AndIndexTwo:@"提示2" AndIndexThree:@"提示3" AndCancle:@"取消" mesasge:@"自定义提示" preferredStyle:UIAlertControllerStyleActionSheet oneIndexHandler:^(UIAlertAction *oneIndex) {
        XCLog(@"选项1");
    } twoIndexHandler:^(UIAlertAction *twoIndex) {
        XCLog(@"选项2");
    } threeIndexHandler:^(UIAlertAction *threeIndex) {
        XCLog(@"选项3");
    } cancleHandler:^(UIAlertAction *cancleIndex) {
        XCLog(@"取消");
    }];
}

#pragma mark UItableVIewDelegate UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *title = self.dataSource[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    switch (indexPath.row) {
        case 0:
            [self styleOne];
            break;
        case 1:
            [self styleTwo];
            break;
        case 2:
            [self styleThree];
            break;
        case 3:
            [self styleFour];
            break;
        default:
            break;
    }
    
}

#pragma mark 为了适配IOS 11 出现 控制头部尾部高度问题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
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
