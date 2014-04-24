//
//  ProductStore.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/22/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <AdSupport/AdSupport.h>
#import "PGPSProductStore.h"
#import "Product.h"
#import "ProductAssembler.h"
#import "PGPSLocationManager.h"

#define API_TEST_KEY @"TAVSjur9pYu8jeKGuFojLVXsqo4SNDM1"

@interface PGPSProductStore()
@property (nonatomic) NSString *advId;
@end
@implementation PGPSProductStore

+(PGPSProductStore*)sharedInstance
{
    static dispatch_once_t token;
    static  PGPSProductStore *sharedInstance = nil;
    dispatch_once(&token, ^{
        sharedInstance = [[PGPSProductStore alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Fetch Methods

-(void) getProductOfType:(NSString*)productType withCallback:(PSCompletionBlock)callback{
    id adIdObject = [ASIdentifierManager sharedManager].advertisingIdentifier;
    NSLog(@"Adv Id: %@",adIdObject);
    
    NSString *urlStr = @"http://api.retailigence.com/v2.0/products?apikey=TAVSjur9pYu8jeKGuFojLVXsqo4SNDM1&requestorid=%3C__NSConcreteUUID%200x9b94370%3E%20AAD91CEA-E126-4513-B022-FAC48647E461";
    
    NSString *postalCode = ([PGPSLocationManager sharedInstance].postalCode) ? [PGPSLocationManager sharedInstance].postalCode : @"90291";
    urlStr = [NSString stringWithFormat:@"%@&userlocation=%@&productType=clothing&keywords=%@",urlStr,postalCode,productType];
    NSLog(@"URLSTR:%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self didLoadProduct:responseObject witheCallback:callback];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        callback(error);
    }];
    [operation start];
}

-(void)didLoadProduct:(id)response witheCallback:(PSCompletionBlock)callback{
    NSDictionary *retailigenceResult = [response objectForKey:@"RetailigenceSearchResult"];
    NSArray *results = [retailigenceResult objectForKey:@"results"];
    self.products = [[ProductAssembler sharedInstance] createProductSFromJsonResponse:results];
    callback(nil);
}



@end
