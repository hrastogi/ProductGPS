//
//  PGPSAddressCell.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/17/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "PGPSAddressCell.h"
#import <MapKit/MapKit.h>
#import "Product.h"
#import "Address.h"

@interface PGPSAddressCell()
@property (nonatomic) IBOutlet UILabel *addressLabel;
@property (nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation PGPSAddressCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateCellWithProduct:(Product*) product{
    self.addressLabel.text = product.address.streetAddress;
}

@end
