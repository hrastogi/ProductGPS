//
//  MainMenuViewController.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 1/21/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.menuItemsArray = [NSArray arrayWithObjects:@"Accessories",@"Coat", @"Dress",@"Lingerie",@"Shirt",@"Shoes",@"Skirt",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //5.1 you do not need this if you have set SettingsCell as identifier in the storyboard (else you can remove the comments on this code)
    if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
      }

    cell.textLabel.text = [self.menuItemsArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

@end
