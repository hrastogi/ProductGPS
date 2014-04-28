//
//  PGPSItemDetailViewController.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/16/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#import "PGPSItemDetailViewController.h"
#import "PGPSPhoneCell.h"
#import "PGPSAddressCell.h"
#import "Product.h"
#import "Image.h"

@interface PGPSItemDetailViewController ()
@property (nonatomic) IBOutlet UIImageView *productImageView;
@property (nonatomic) IBOutlet UITableView *productTableView;
@property (nonatomic) IBOutlet UILabel *productNameLbl;
@property (nonatomic) IBOutlet UILabel *productBrandLbl;
@property (nonatomic) IBOutlet UILabel *productPriceLbl;
@property (nonatomic) IBOutlet UILabel *productSizeLbl;
@end

@implementation PGPSItemDetailViewController

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
    [self loadProduct];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - UI Setup
-(void) loadProduct{
    self.productNameLbl.text = self.selectedProduct.name;
    self.productBrandLbl.text = self.selectedProduct.brand;
    self.productPriceLbl.text = [NSString stringWithFormat:@"$%@",self.selectedProduct.price];
    self.productSizeLbl.text = [NSString stringWithFormat:@"Size : %@",self.selectedProduct.size];
    [self loadImage];
    [self.productTableView reloadData];
}

-(void) loadImage{ NSURL *url = [NSURL URLWithString:self.selectedProduct.smallImage.imageLink];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.png"];
    
    __weak UIImageView *imageView = self.productImageView;
    [self.productImageView setImageWithURLRequest:request
                                 placeholderImage:placeholderImage
                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                              
                                              imageView.image = image;
                                              [imageView setNeedsLayout];
                                              
                                          } failure:nil];
}

#pragma mark - UITable view Datasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (indexPath.row == 0) ? 150.0f : 60.0f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (indexPath.row == 0) ? [self addressCellForTable:tableView] : [self phoneCellForTable:tableView];
}

-(PGPSAddressCell*) addressCellForTable:(UITableView*)tableView{
    static NSString *itemListCellIdentifier = @"PGPSAddressCell";
    
    
    PGPSAddressCell *cell = (PGPSAddressCell *)[tableView dequeueReusableCellWithIdentifier:itemListCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PGPSAddressCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell updateCellWithProduct:self.selectedProduct];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(PGPSPhoneCell*) phoneCellForTable:(UITableView*) tableView{
    static NSString *itemListCellIdentifier = @"PhoneCell";
    
    
    PGPSPhoneCell *cell = (PGPSPhoneCell *)[tableView dequeueReusableCellWithIdentifier:itemListCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PGPSPhoneCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell updateCellWithProduct:self.selectedProduct];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - Utility

@end
