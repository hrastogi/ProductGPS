//
//  MainMenuViewController.h
//  ProductGPS
//
//  Created by HEENA RASTOGI on 1/21/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) IBOutlet UITableView *menuTableView;
@property (nonatomic) NSArray *menuItemsArray;

@end
