//
//  Image.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/12/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject
@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *imageLink;
-(id)initWithImageName:(NSString*)imageName andImageLink:(NSString*) imageLink;
@end
