//
//  ProductAssembler.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/23/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "ProductAssembler.h"
#import "Product.h"
#import "Image.h"

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
-(NSArray*)createProductSFromJsonResponse:(NSDictionary*)results{
    NSMutableArray *products = [NSMutableArray array];   
    for (NSDictionary *result in results){
        Product *product  = [[Product alloc] init];
        NSDictionary *searchResult =[result objectForKey:@"SearchResult"];
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
    product.price = [productResponse objectForKey:@"msrp"];
    
    NSArray *images = [productResponse objectForKey:@"images"];
    for(NSDictionary *image in images){
        NSDictionary *imageInfo = [image objectForKey:@"ImageInfo"];
        NSString *imageName = [imageInfo objectForKey:@"imageName"];
        NSString *imageLink = [imageInfo objectForKey:@"link"];
        
        if([imageName isEqualToString:@"LARGE"]){
            product.largeImage = [[Image alloc] initWithImageName:imageName andImageLink: imageLink];
        }
        else if ([imageName isEqualToString:@"SMALL"]){
           product.smallImage= [[Image alloc] initWithImageName:imageName andImageLink: imageLink];
        }
    }
    
    return product;
}

@end
