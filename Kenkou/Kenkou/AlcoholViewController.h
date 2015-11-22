//
//  AlcoholViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlcoholicDrinkTableViewCell.h"
#import "PopUpViewController.h"
#import "AppDelegate.h"

@interface AlcoholViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, addAlcoholicDrink, enableScrolling>

// Outlets
@property (weak, nonatomic) IBOutlet UITableView *uitableviewAlcoholicDrinks;

// Properties
@property (nonatomic, strong) NSMutableArray *nsmutarrAlcoholicDrink;
@property (nonatomic, strong) PopUpViewController *popUpHelp;

// Action methods
- (IBAction)addAlcoholicDrink:(id)sender;
- (IBAction)saveRecord:(id)sender;

@end
