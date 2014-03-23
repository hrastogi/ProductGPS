//
//  ProductStore.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/22/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductStore : NSObject
+(ProductStore*) sharedInstance;
-(void) requestData;

@end
