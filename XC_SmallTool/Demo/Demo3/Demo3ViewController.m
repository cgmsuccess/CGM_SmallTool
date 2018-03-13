//
//  Demo3ViewController.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/13.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "Demo3ViewController.h"
#import "XC_PhotoSelect.h"

@interface Demo3ViewController ()

/**     照片选择     ****/
@property (nonatomic,strong)XC_PhotoSelect *photoSelect;

/**    图片显示      ****/
@property (nonatomic,strong) UIImageView *imageview ;

@end

@implementation Demo3ViewController

-(XC_PhotoSelect *)photoSelect
{
    if (!_photoSelect) {
        _photoSelect = [XC_PhotoSelect new];
    }
    return _photoSelect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
    
}

-(void)setUI
{
    self.title = @"照片选择";
    self.view.backgroundColor = [UIColor whiteColor];
   
    UILabel *markLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kNavbarHeight, KmainScreenHeiht, 44)];
    [self.view addSubview:markLabel];
    markLabel.text = @"单击屏幕选择图片";

    
    _imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _imageview.center = self.view.center ;
    [self.view addSubview:_imageview];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //图片选择
    WS(weakSelf);
    [self.photoSelect selectPhotoviewCtrl:weakSelf photographicOrPhotoalbum:YES];
    self.photoSelect.photoBlock = ^(NSString *base64,UIImage *image){
        
        XCLog(@"base64 = %@" ,base64);
        XCLog(@"image = %@" ,image);
        weakSelf.imageview.image = image ;
    };
}

-(void)cilckMore
{
    XCLog(@"点击了右边的按钮");
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
