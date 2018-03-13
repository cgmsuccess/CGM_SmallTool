//
//  XC_GaodeMap.h
//  zhutong
//
//  Created by apple on 17/9/16.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface XC_GaodeMap : NSObject


-(void)navigationGaodeCoord:(CLLocationCoordinate2D)currentCoord AndEndCoored:(CLLocationCoordinate2D)endCoord AndaddressName:(NSString *)addressName;



@end
