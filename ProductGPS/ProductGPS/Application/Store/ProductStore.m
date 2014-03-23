//
//  ProductStore.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 3/22/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "ProductStore.h"
static NSString * const BaseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";

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

-(void) requestData{
    // 1
    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"response:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}

@end
