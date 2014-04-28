//
//  Product.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Address,Image;
@interface Product : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSString *description;
@property (nonatomic) NSNumber *price;
@property (nonatomic) NSString *brand;
@property (nonatomic) NSNumber *distance;
@property (nonatomic) NSString *distanceUnit;
@property (nonatomic) Address *address;
@property (nonatomic) NSString *retailerName;
@property (nonatomic) Image *largeImage;
@property (nonatomic) Image *smallImage;
@property (nonatomic) NSArray *variants;
@property (nonatomic) NSString *size;
@property (nonatomic) NSString *color;
@property (nonatomic) BOOL isVariant;
@property (nonatomic) BOOL hasVariants;
@property (nonatomic) NSString *productId;
@property (nonatomic) NSString *productDescription;

@end
