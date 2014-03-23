//
//  ProductStore.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/22/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "ProductStore.h"
#import <AdSupport/AdSupport.h>
//static NSString * const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";
#define API_TEST_KEY @"TAVSjur9pYu8jeKGuFojLVXsqo4SNDM1"

@interface ProductStore()
@property (nonatomic) NSString *advId;
@end
@implementation ProductStore

+(ProductStore*)sharedInstance
{
    static dispatch_once_t token;
    static  ProductStore *sharedInstance = nil;
    dispatch_once(&token, ^{
        sharedInstance = [[ProductStore alloc] init];
    });
    return sharedInstance;
}



#pragma mark - Fetch Methods

-(void) getProductWithName:(NSString*)name andKeyword:(NSString*)keyword{
}

-(void) requestData{
    id adIdObject = [ASIdentifierManager sharedManager].advertisingIdentifier;
    NSLog(@"Adv Id: %@",adIdObject);
    
    // 1
    NSString *urlStr = @"http://api.retailigence.com/v2.0/products?apikey=TAVSjur9pYu8jeKGuFojLVXsqo4SNDM1&requestorid=%3C__NSConcreteUUID%200x9b94370%3E%20AAD91CEA-E126-4513-B022-FAC48647E461&userlocation=94301&productType=clothing&keywords=dress";
    NSLog(@"URLSTR:%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"response:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    [operation start];
}

@end
