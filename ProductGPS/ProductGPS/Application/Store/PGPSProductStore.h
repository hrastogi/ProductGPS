//
//  ProductStore.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/22/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^PSCompletionBlock)(NSError *error);
//typedef void (^ASCompletionBlock)(BOOL success, NSDictionary *response, NSError *error);

@interface PGPSProductStore : NSObject
@property (nonatomic)NSArray *products;

+(PGPSProductStore*) sharedInstance;
-(void) getProductOfType:(NSString*)productType withCallback:(PSCompletionBlock)callback;

@end
