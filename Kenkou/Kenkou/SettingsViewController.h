//
//  SettingsViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/2/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol saveSettingFieldData <NSObject>

- (void) saveFieldWithData:(id)data withIdentifier:(NSInteger)identifier;
- (void) removeViewController;

@end

@interface SettingsViewController : UIViewController

// Outlets
@property (weak, nonatomic) IBOutlet UITextView *uitextviewDataField;

// Properties
@property (nonatomic, strong) NSString *strViewControllerTitle;
@property (nonatomic, strong) NSString *strTextViewPlaceholder;
@property UIKeyboardType keyboardType;
@property NSInteger nsintIdentifier;
@property (nonatomic, strong) id <saveSettingFieldData> delegate;

// Action methods
- (IBAction)saveFieldData:(id)sender;

@end
