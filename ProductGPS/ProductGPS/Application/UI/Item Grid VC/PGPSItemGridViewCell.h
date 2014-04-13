//
//  PGPSItemGridViewCell.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/12/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;
@interface PGPSItemGridViewCell : UICollectionViewCell
@property (nonatomic) UIImageView *productImageView;

-(void) updateCellWithProduct:(Product*) product;
@end
