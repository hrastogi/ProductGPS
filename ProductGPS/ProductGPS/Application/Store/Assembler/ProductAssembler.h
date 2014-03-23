//
//  ProductAssembler.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;
@interface ProductAssembler : NSObject
+(ProductAssembler*) sharedInstance;
-(Product*)createProductFromJsonResponse:(id) jsonResponse;
@end
