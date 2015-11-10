//
//  SettingsTableViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/2/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface SettingsTableViewController : UITableViewController <saveSettingFieldData>

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblBirthYear;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolSex;
@property (weak, nonatomic) IBOutlet UISwitch *uiswitchExercise;

// Properties
@property (nonatomic, strong) NSString *strFirstName;
@property (nonatomic, strong) NSString *strLastName;
@property NSInteger nsintBirthYear;
@property CGFloat flHeight;
@property CGFloat flWeight;

// Action methods
- (IBAction)saveSettings:(id)sender;

@end
