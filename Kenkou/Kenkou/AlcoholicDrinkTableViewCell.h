//
//  AlcoholicDrinkTableViewCell.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlcoholicDrinkTableViewCell : UITableViewCell

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *uilabelAlcoholicDrinkName;
@property (weak, nonatomic) IBOutlet UILabel *uilabelConsumptionMultiplicity;

// Properties
@property NSInteger nsintConsumptionMultiplicity;
@property double doubleAlcoholPercentage;
@property double doubleVolume;

// Action methods
- (IBAction)addConsumptionMultiplicity:(id)sender;
- (IBAction)substractConsumptionMultiplicity:(id)sender;

@end
