//
//  Image.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/12/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "Image.h"

@implementation Image
-(id)initWithImageName:(NSString*)imageName andImageLink:(NSString*) imageLink{
    if(self = [super init]){
        self.imageName = imageName;
        self.imageLink = imageLink;
    }
    return self;
}
@end
