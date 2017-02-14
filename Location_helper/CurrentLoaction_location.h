//
//  CurrentLoaction_location.h
//  CurrentLocation
//
//  Created by apple on 17/2/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>

typedef void (^loactionCallBack)(NSString *shengfen,NSString *city ,NSString *qu, NSString *lu);

@interface CurrentLoaction_location : NSObject<CLLocationManagerDelegate>

//   <<************获取到地理位置的回调****************>>
@property (nonatomic,copy)loactionCallBack callBack ;



+(instancetype)shareLoationManager;

// <<< 检查 定位权限>>>
-(void)cheakLoaction;

// <<<**********检查自己的位置**************>>
-(void)findMeLocation;


@end
