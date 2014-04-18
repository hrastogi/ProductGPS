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
#import "Product.h"
#import "Image.h"

@interface PGPSItemDetailViewController ()
@property (nonatomic) IBOutlet UIImageView *productImageView;
@property (nonatomic) IBOutlet UITableView *productTableView;
@property (nonatomic) IBOutlet UILabel *productName;
@property (nonatomic) IBOutlet UILabel *productBrand;
@property (nonatomic) IBOutlet UILabel *productPrice;
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
    self.productName.text = self.selectedProduct.name;
    self.productBrand.text = self.selectedProduct.brand;
    self.productPrice.text = [NSString stringWithFormat:@"$%@",self.selectedProduct.price];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    static NSString *cellIdentifier = @"Detail Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//    }
//    
//    cell.textLabel.text = @"Address";
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *itemListCellIdentifier = @"PhoneCell";
    
    PGPSPhoneCell *cell = (PGPSPhoneCell *)[tableView dequeueReusableCellWithIdentifier:itemListCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PGPSPhoneCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    return cell;
}


#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
