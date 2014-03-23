//
//  ItemsListViewController.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 1/21/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemListCell;
@interface ItemsListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) IBOutlet UITableView *itemListTableView;
@property (nonatomic) NSArray *products;
@property (nonatomic,weak) IBOutlet ItemListCell *itemCell;
@end
