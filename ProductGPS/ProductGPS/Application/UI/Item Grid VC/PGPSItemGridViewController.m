//
//  PGPSItemGridViewController.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/7/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "PGPSItemGridViewController.h"
#import "PGPSItemGridViewCell.h"


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

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.products.count/2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"itemCell";
    
    PGPSItemGridViewCell *cell = (PGPSItemGridViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
  //  NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
   
   // NSString *cellData = [data objectAtIndex:indexPath.row];
    
   // [cell.titleLabel setText:cellData];
    
    return cell;
    
}
@end
