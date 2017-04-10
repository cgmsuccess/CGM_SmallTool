//
//  ViewController.m
//  QQ_ShareView
//
//  Created by apple on 17/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

#import "CGM_shareView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    self.view.backgroundColor =[UIColor redColor ];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSArray *iamgeArr = @[@"ic_qiuqiu.png",@"ic_qiuqiu.png",@"ic_qiuqiu.png",@"ic_qiuqiu.png"];
    
    NSArray *titleArr = @[@"qq",@"qq",@"qq",@"qq"];

    CGM_shareView *shareView = [[CGM_shareView alloc] initWithTitle:titleArr AndWithImage:iamgeArr ];
    
    shareView.selectBlock=^(NSString *str){
    
    };
    [self.view addSubview: shareView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
