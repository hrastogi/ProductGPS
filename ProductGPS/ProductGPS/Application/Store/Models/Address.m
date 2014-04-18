//
//  Address.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "Address.h"

@implementation Address
-(id) initWithLocation:(NSDictionary*) location andAddress:(NSDictionary*)address{
    if(self = [super init]){
        self.latitude = [location objectForKey:@"latitude"];
        self.longitude = [location objectForKey:@"longitude"];
        self.postal = [address objectForKey:@"postal"];
        self.state = [address objectForKey:@"state"];
        self.streetAddress = [address objectForKey:@"address1"];
        self.city = [address objectForKey:@"city"];
        self.country = [address objectForKey:@"country"];
    }
    return self;
}
@end
