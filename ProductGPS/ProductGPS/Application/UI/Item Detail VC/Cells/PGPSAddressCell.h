//
//  PGPSAddressCell.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/17/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;
@interface PGPSAddressCell : UITableViewCell
-(void) updateCellWithProduct:(Product*) product;
@end
