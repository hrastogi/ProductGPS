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
-(NSArray*)createProductSFromJsonResponse:(NSDictionary*)jsonResponse{
    NSMutableArray *products = [NSMutableArray array];
    NSArray *results = [jsonResponse objectForKey:@"results"];
   
    for (NSDictionary *result in results){
        Product *product  = [[Product alloc] init];
        NSDictionary *searchResult =[result objectForKey:@"searchResult"];
        product = [self createProductFromDictionary:searchResult];
        [products addObject:product];
    }
   
    return products;
}

-(Product*)createProductFromDictionary:(NSDictionary*) searchResult{
    Product *product = [[Product alloc] init];
    NSDictionary *productResponse = [searchResult objectForKey:@"product"];
    product.name = [productResponse objectForKey:@"name"];
    product.brand = [productResponse objectForKey:@"brand"];
    
    return product;
}

@end
