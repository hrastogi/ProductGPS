//
//  PGPSItemGridViewController.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/7/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGPSItemGridViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic) NSArray *products;
@end
