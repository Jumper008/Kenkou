//
//  FoodTableViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/16/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpViewController.h"

@interface FoodTableViewController : UITableViewController <enableScrolling>

// Outlets
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSave;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolFruitsAndVegetables;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolCereals;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolSugars;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolFats;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolCalcium;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolSalts;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolWater;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolEatingResponsibly1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolEatingResponsibly2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolEatingResponsibly3;

// Properties
@property (nonatomic, strong) PopUpViewController *popUpHelp;

//Action methods
- (IBAction)helpFruitsAndVegetables:(UIButton *)sender;
- (IBAction)helpCereals:(UIButton *)sender;
- (IBAction)helpSugars:(UIButton *)sender;
- (IBAction)helpFats:(UIButton *)sender;
- (IBAction)helpCalcium:(UIButton *)sender;
- (IBAction)helpSalts:(UIButton *)sender;
- (IBAction)helpWater:(UIButton *)sender;
- (IBAction)helpEatingResponsibly1:(UIButton *)sender;
- (IBAction)helpEatingResponsibly2:(UIButton *)sender;
- (IBAction)helpEatingResponsibly3:(UIButton *)sender;
@end
