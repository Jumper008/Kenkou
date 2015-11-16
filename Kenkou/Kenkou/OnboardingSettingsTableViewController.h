//
//  OnboardingSettingsTableViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/12/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnboardingSettingsTableViewController : UITableViewController

// Outlets
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldBirthYear;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldHeight;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldWeight;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolSex;
@property (weak, nonatomic) IBOutlet UISwitch *uiswitchExercise;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSave;

// Properties
@property (nonatomic, strong) NSString *strFirstName;
@property (nonatomic, strong) NSString *strLastName;
@property NSInteger nsintBirthYear;
@property CGFloat flHeight;
@property CGFloat flWeight;

// Action methods

@end
