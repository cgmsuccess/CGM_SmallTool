//
//  ViewController.m
//  CurrentLocation
//
//  Created by apple on 17/2/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

#import "CurrentLoaction_location.h"

@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager* locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self findMe];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 40, 40, 40);
    btn.backgroundColor = [UIColor   redColor   ];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnCilck) forControlEvents:UIControlEventTouchUpInside];

}



-(void)btnCilck{
    
    //检查更新
   // [[CurrentLoaction_location shareLoationManager] cheakLoaction];
    
    //定位自己的位置
    [[CurrentLoaction_location shareLoationManager] findMeLocation];
    
    [CurrentLoaction_location shareLoationManager].callBack = ^(NSString *shengfen,NSString *city ,NSString *qu, NSString *lu){
    
        NSLog( @"省份 = %@ , 城市 = %@ ,行政区 = %@ , 路 = %@" ,shengfen,shengfen,shengfen,shengfen);
    };
}

- (void)findMe
{
    
    if ([[UIDevice currentDevice] systemVersion].doubleValue > 8.0) {//如果iOS是8.0以上版本
        
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        NSLog(@"requestAlwaysAuthorization");
        [self.locationManager requestWhenInUseAuthorization];
        }
    }
    
    if ([CLLocationManager locationServicesEnabled]  //确定用户的位置服务启用
        &&[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied)
        //位置服务是在设置中禁用
    {
        NSLog(@"定位被禁止");
    }
    else{
    //开始定位，不断调用其代理方法
    [self.locationManager startUpdatingLocation];
    }
    
    
    NSLog(@"start gps");
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    // 1.获取用户位置的对象
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"纬度:%f 经度:%f", coordinate.latitude, coordinate.longitude);
    
    // 2.停止定位
    [manager stopUpdatingLocation];
    
    [self coordinate:coordinate];
}


- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
    }
}

-(void)coordinate:(CLLocationCoordinate2D)coordinate{
    CLGeocoder *geo = [CLGeocoder new];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [geo reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@",error);
        }else{
            for (CLPlacemark *mark in placemarks) {
                
                NSDictionary *addressDic = mark.addressDictionary;
                
                NSString *state=[addressDic objectForKey:@"State"];
                
                NSString *city=[addressDic objectForKey:@"City"];
                
                NSString *subLocality=[addressDic objectForKey:@"SubLocality"];
                
                NSString *street=[addressDic objectForKey:@"Street"];
                
                NSLog(@"所在城市====%@ %@ %@ %@", state, city, subLocality, street);
                
                [_locationManager stopUpdatingLocation];
            }
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
