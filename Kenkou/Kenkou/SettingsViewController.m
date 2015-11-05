//
//  SettingsViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/2/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:self.strViewControllerTitle];
    
    self.uitextviewDataField.text = self.strTextViewPlaceholder;
    
    self.uitextviewDataField.keyboardType = self.keyboardType;
    
    self.uitextviewDataField.contentInset = UIEdgeInsetsMake(self.uitextviewDataField.frame.size.height /-2.5,0.0,0,0.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveFieldData:(id)sender
{
    
    [self.delegate saveFieldWithData:self.uitextviewDataField.text withIdentifier:self.nsintIdentifier];
    [self.delegate removeViewController];
}
@end
