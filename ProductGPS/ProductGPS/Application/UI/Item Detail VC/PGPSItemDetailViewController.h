//
//  PGPSItemDetailViewController.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/16/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product,PGPSPhoneCell;
@interface PGPSItemDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) Product *selectedProduct;
@property (nonatomic,weak) IBOutlet PGPSPhoneCell *phoneCell;
@end
