//
//  MainTableViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/12/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsTableViewController.h"
#import "AppDelegate.h"

@interface MainTableViewController : UITableViewController <saveSettings>

// Outlets
@property (weak, nonatomic) IBOutlet UIButton *uibuttonRegister;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonResults;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonMyProgress;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonFoodClassification;

// Properties

// Action methods

@end
