//
//  PGPSItemGridViewController.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/7/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "UIImageView+AFNetworking.h"

#import "PGPSItemGridViewController.h"
#import "PGPSItemGridViewCell.h"
#import "PGPSItemDetailViewController.h"
#import "Product.h"
#import "Image.h"

@interface PGPSItemGridViewController ()
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@end

@implementation PGPSItemGridViewController

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
    self.title = self.productType;
    
    // Set this in every view controller so that the back button displays back instead of the root view controller name
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    // Do any additional setup after loading the view from its nib.
    
    [self.collectionView registerClass:[PGPSItemGridViewCell class] forCellWithReuseIdentifier:@"itemCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(150, 200)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollection View DataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"itemCell";
    
    PGPSItemGridViewCell *cell = (PGPSItemGridViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
 
    Product *product = [self.products objectAtIndex:indexPath.row];
    [cell updateCellWithProduct:product];
    
    NSURL *url = [NSURL URLWithString:product.smallImage.imageLink];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.png"];
    
    __weak PGPSItemGridViewCell *weakCell = cell;
    
    [cell.productImageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.productImageView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    return cell;
    
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    PGPSItemDetailViewController *detailVC = [[PGPSItemDetailViewController alloc] init];
    detailVC.selectedProduct = [self.products objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
