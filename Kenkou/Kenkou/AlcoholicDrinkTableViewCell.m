//
//  AlcoholicDrinkTableViewCell.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "AlcoholicDrinkTableViewCell.h"

@implementation AlcoholicDrinkTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addConsumptionMultiplicity:(id)sender
{
    self.nsintConsumptionMultiplicity = self.nsintConsumptionMultiplicity + 1;
    self.uilabelConsumptionMultiplicity.text = [[NSString alloc] initWithFormat:@"%li", self.nsintConsumptionMultiplicity];
}

- (IBAction)substractConsumptionMultiplicity:(id)sender
{
    if (
        self.nsintConsumptionMultiplicity > 0
        )
    {
        self.nsintConsumptionMultiplicity = self.nsintConsumptionMultiplicity - 1;
        self.uilabelConsumptionMultiplicity.text = [[NSString alloc] initWithFormat:@"%li", self.nsintConsumptionMultiplicity];
    }
    else
    {
        // Does nothing
    }
}

@end
