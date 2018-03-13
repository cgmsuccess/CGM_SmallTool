//
//  XC_GaodeMap.m
//  zhutong
//
//  Created by apple on 17/9/16.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import "XC_GaodeMap.h"

@implementation XC_GaodeMap

-(void)navigationGaodeCoord:(CLLocationCoordinate2D)currentCoord AndEndCoored:(CLLocationCoordinate2D)endCoord AndaddressName:(NSString *)addressName
{
    //起点
    MKMapItem *currentLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:currentCoord addressDictionary:nil]];
    //目的地的位置
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:endCoord addressDictionary:nil]];
    toLocation.name = @"目的地";
    toLocation.name =addressName;
    NSArray *items = [NSArray arrayWithObjects:currentLocation, toLocation, nil];
    NSDictionary *options = @{ MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey:@YES };
    //打开苹果自身地图应用，并呈现特定的item
    [MKMapItem openMapsWithItems:items launchOptions:options];
}

@end
