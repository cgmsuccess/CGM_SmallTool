//
//  Demo4ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/13.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo4ViewController.h"
#import "CGM_UIpickerView.h"
@interface Demo4ViewController ()

/**     选择器元素     ****/
@property (nonatomic,strong)NSMutableArray *dataSource;

/**    选择器      ****/
@property (nonatomic,strong)CGM_UIpickerView *pickerView;

@end

@implementation Demo4ViewController

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 0; i < 40; i++) {
            NSString *string = [NSString stringWithFormat:@"选择的元素 %d",i];
            [_dataSource addObject:string];
        }
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

-(void)setUI
{
    self.title = @"一级选择器";
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, kNavbarHeight, KmainScreenWidth, 100)];
    [self.view addSubview:label];
    label.text = @"单击查看效果";
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.title = @"1级选择器";
    self.view.backgroundColor = [UIColor whiteColor];
    self.pickerView = [[CGM_UIpickerView alloc] initWithDataArr:self.dataSource];

    [self.pickerView setSelectIndex:5];  // 默认选中角标
    self.pickerView.block = ^(NSString *string, NSInteger index) {
        XCLog(@"string = %@ ,index = %ld",string , index);
    };
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
