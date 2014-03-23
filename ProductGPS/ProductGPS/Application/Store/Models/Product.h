//
//  Product.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Address;
@interface Product : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSString *description;
@property (nonatomic) NSNumber *price;
@property (nonatomic) NSString *brand;
@property (nonatomic) NSNumber *distance;
@property (nonatomic) NSString *phoneNumber;
@property (nonatomic) Address *adress;
@property (nonatomic) NSString *retailerName;

@end
