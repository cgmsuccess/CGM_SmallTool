//
//  CurrentLoaction_location.m
//  CurrentLocation
//
//  Created by apple on 17/2/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CurrentLoaction_location.h"

#define IOS_8 [[UIDevice currentDevice] systemVersion].doubleValue >= 8.0

@interface CurrentLoaction_location()

@property (nonatomic, strong) CLLocationManager* locationManager; //管理类

@end

@implementation CurrentLoaction_location

+(instancetype)shareLoationManager{
    static CurrentLoaction_location *loactonManager = nil;
    static dispatch_once_t lock;
    dispatch_once(&lock,^{
        loactonManager = [[[self class] alloc] init];
    });
    return loactonManager ;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        
        if (IOS_8) {  //申请定位权限
            if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                NSLog(@"requestAlwaysAuthorization");
                [self.locationManager requestWhenInUseAuthorization];
            }
        }
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}


#pragma mark CLLocationManagerDelegate 代理
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

#pragma mark  经纬度geo 定位反编码
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
                
               // NSLog(@"所在城市====%@ %@ %@ %@", state, city, subLocality, street);
                
                [_locationManager stopUpdatingLocation];
                
                self.callBack(state,city,subLocality,street);
            }
        }
    }];
}

///<<*****************定位错误这里，打印********************>>
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
        NSLog(@"error = %@ ", error);
    }
}


#pragma mark 个人定位
- (void)findMeLocation
{
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

#pragma mark 检查定位权限是否被禁止
//   <<************检查定位权限是否被禁止*************>>
-(void)cheakLoaction{
    if ([CLLocationManager locationServicesEnabled]  //确定用户的位置服务启用
        &&[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied)
        //位置服务是在设置中禁用
    {
        NSLog(@"定位被禁止");
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"地图定位设置" message:@"您的定位设置被关闭了,前往设置打开定位" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSURL*url=[NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }]];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
}


@end
