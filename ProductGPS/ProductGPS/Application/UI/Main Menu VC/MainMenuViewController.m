//
//  MainMenuViewController.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 1/21/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "MainMenuViewController.h"
#import "PGPSItemGridViewController.h"
#import "PGPSProductStore.h"

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
    self.title = @"ProductGPS";
    
    // Do any additional setup after loading the view from its nib.
    self.menuItemsArray = [NSArray arrayWithObjects:@"Coat", @"Dress",@"Lingerie",@"Shirt",@"Short",@"Skirt",nil];
    
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
    return self.menuItemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PSCompletionBlock callback = ^(NSError *error){
        if(error){
            NSLog(@"Oops error : %@",error.localizedDescription);
        }
        else{
            
            // We have recieved data, push the item list view on stack.
            PGPSItemGridViewController *itemmsGridVC = [[PGPSItemGridViewController alloc] initWithNibName:@"PGPSItemGridViewController" bundle:nil];
            itemmsGridVC.products = [PGPSProductStore sharedInstance].products;
            itemmsGridVC.productType = [self.menuItemsArray objectAtIndex:indexPath.row];
            // Set this in every view controller so that the back button displays back instead of the root view controller name
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
            [self.navigationController pushViewController:itemmsGridVC animated:NO];
        }
    };
    
    [[PGPSProductStore sharedInstance] getProductOfType:[self.menuItemsArray objectAtIndex:indexPath.row] withCallback:callback];
}

@end
