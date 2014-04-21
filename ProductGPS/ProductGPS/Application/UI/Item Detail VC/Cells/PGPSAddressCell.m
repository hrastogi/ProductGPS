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
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake([product.address.latitude floatValue], [product.address.longitude floatValue]);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = {coord, span};
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    
    [self.mapView setRegion:region];
    [self.mapView addAnnotation:annotation];
}

@end
