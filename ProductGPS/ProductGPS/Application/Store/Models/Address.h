//
//  Address.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSString *postal;
@property (nonatomic) NSString *state;
@property (nonatomic) NSString *streetAddress;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *country;

-(id)initWithLocation:(NSDictionary*) location andAddress:(NSDictionary*)address;
@end
