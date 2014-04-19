//
//  PGPSPhoneCell.m
//  ProductGPS
//
//  Created by HEENA RASTOGI on 4/16/14.
//  Copyright (c) 2014 Heena. All rights reserved.
//

#import "PGPSPhoneCell.h"
#import "Product.h"
#import "Address.h"

@interface PGPSPhoneCell()
@property (nonatomic) IBOutlet UILabel *phoneLabel;
@end

@implementation PGPSPhoneCell

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

-(void)updateCellWithProduct:(Product*)product{
    self.phoneLabel.text = product.address.phoneNumber;
}
@end
