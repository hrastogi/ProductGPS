//
//  PGPSLocationManager.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/30/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PGPSLocationManager : NSObject <CLLocationManagerDelegate>{
}
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic) NSString *postalCode;

+(PGPSLocationManager*) sharedInstance;
-(void) startLocationManager;

@end
