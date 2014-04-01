//
//  PGPSLocationManager.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/30/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "PGPSLocationManager.h"

@implementation PGPSLocationManager
+(PGPSLocationManager*)sharedInstance
{
    static dispatch_once_t token;
    static  PGPSLocationManager *sharedInstance = nil;
    dispatch_once(&token, ^{
        sharedInstance = [[PGPSLocationManager alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self; // send loc updates to myself
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}
#pragma mark - Location

-(void) startLocationManager{
    [self.locationManager startUpdatingLocation];
}


#pragma mark - Location delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations objectAtIndex:0];
    [self.locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:self.currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSLog(@"zipcode:%@",placemark.postalCode);
             NSLog(@"Longitude:%f",self.currentLocation.coordinate.longitude);
             NSLog(@"Latitude:%f",self.currentLocation.coordinate.longitude);
             
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
            
         }
     }];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}
@end
