//
//  PGPSItemGridViewCell.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/12/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "PGPSItemGridViewCell.h"
#import "Product.h"

@interface PGPSItemGridViewCell()
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *brandLabel;
@property (nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic) IBOutlet UILabel *distanceLabel;

@end
@implementation PGPSItemGridViewCell

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"PGPSItemGridViewCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    
    return self;
    
}

-(void) updateCellWithProduct:(Product*) product{
    self.nameLabel.text = product.name;
    self.brandLabel.text = product.brand;
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",product.price];
    self.distanceLabel.text = [NSString stringWithFormat:@"%@ %@",product.distance,product.distanceUnit];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
