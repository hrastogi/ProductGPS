//
//  ProductAssembler.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "ProductAssembler.h"
#import "Product.h"

@implementation ProductAssembler
+(ProductAssembler*)sharedInstance
{
    static dispatch_once_t token;
    static  ProductAssembler *sharedInstance = nil;
    dispatch_once(&token, ^{
        sharedInstance = [[ProductAssembler alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Assembler
-(Product*)createProductFromJsonResponse:(id)jsonResponse{
    Product *product = [[Product alloc] init];
    return product;
}

@end
