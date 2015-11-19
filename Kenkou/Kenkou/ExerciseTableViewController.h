//
//  ExerciseTableViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/16/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseTableViewController : UITableViewController

// Outlets
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSave;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldAerobic;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldAnaerobic;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonAddAerobicMinutes;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSubstractAerobicMinutes;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonAddAnaerobicMinutes;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSubstractAnaerobicMinutes;

// Properties
@property NSInteger nsintAerobicMinutes;
@property NSInteger nsintAnaerobicMinutes;

// Action methods
- (IBAction)addMinutes:(UIButton *)sender;
- (IBAction)substractMinutes:(UIButton *)sender;

@end
