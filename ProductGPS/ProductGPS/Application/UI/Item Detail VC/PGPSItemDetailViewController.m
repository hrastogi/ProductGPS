//
//  PGPSItemDetailViewController.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/16/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#import "PGPSItemDetailViewController.h"
#import "Product.h"
#import "Image.h"

@interface PGPSItemDetailViewController ()
@property (nonatomic) IBOutlet UIImageView *productImageView;
@property (nonatomic) IBOutlet UITableView *productTableView;
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
    NSURL *url = [NSURL URLWithString:self.selectedProduct.smallImage.imageLink];
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
@end
