//
//  MainTableViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/12/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsTableViewController.h"
#import "ResultsViewController.h"
#import "AppDelegate.h"
#import "PopUpViewController.h"

@interface MainTableViewController : UITableViewController <saveSettings, enableScrolling>

// Outlets
@property (weak, nonatomic) IBOutlet UIButton *uibuttonRegister;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonResults;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonMyProgress;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonFoodClassification;

// Properties
@property (nonatomic, strong) PopUpViewController *popUpUnderDevelopment;
@property (nonatomic, strong) NSString *strUsername;

// Action methods
- (IBAction)showUnderDevelopmentPopUp:(id)sender;

@end
