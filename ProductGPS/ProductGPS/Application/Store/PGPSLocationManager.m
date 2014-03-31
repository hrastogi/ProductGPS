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


#pragma mark - Location

-(void) startLocationManager{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager startUpdatingLocation];
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    NSLog(@"Latitude :%.8f",currentLocation.coordinate.latitude);
    NSLog(@"Longitude :%.8f",currentLocation.coordinate.longitude);
    
}
@end
