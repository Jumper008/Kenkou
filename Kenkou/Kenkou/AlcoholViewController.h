//
//  AlcoholViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlcoholicDrinkTableViewCell.h"

@interface AlcoholViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

// Outlets

// Properties
@property (nonatomic, strong) NSMutableArray *nsmutarrAlcoholicDrink;

// Action methods

@end
