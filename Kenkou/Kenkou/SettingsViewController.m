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
    
    UITapGestureRecognizer *OffKeyboardtap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKeyboard)];
    [self.view addGestureRecognizer:OffKeyboardtap];
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
    /*CASE*/
    if (
        // Is the field birthyear?
        self.nsintIdentifier == 3
        )
    {
        if (
            ([self.uitextviewDataField.text integerValue] > 2000) ||
            ([self.uitextviewDataField.text integerValue] < 1985)
            )
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Año inválido"
                                                                           message:@"Por favor modifique el valor."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self.delegate saveFieldWithData:self.uitextviewDataField.text withIdentifier:self.nsintIdentifier];
            [self.delegate removeViewController];
        }
    }
    else if (
        // Is the field height?
        self.nsintIdentifier == 4
        )
    {
        if (
            ([self.uitextviewDataField.text floatValue] > 2.15) ||
            ([self.uitextviewDataField.text floatValue] < 1.00)
            )
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Altura inválida"
                                                                           message:@"Por favor modifique el valor."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self.delegate saveFieldWithData:self.uitextviewDataField.text withIdentifier:self.nsintIdentifier];
            [self.delegate removeViewController];
        }
    }
    else if (
        // Is the field weight?
        self.nsintIdentifier == 5
        )
    {
        if (
            ([self.uitextviewDataField.text floatValue] > 150) ||
            ([self.uitextviewDataField.text floatValue] < 20)
            )
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Peso inválido"
                                                                           message:@"Por favor modifique el valor."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            [self.delegate saveFieldWithData:self.uitextviewDataField.text withIdentifier:self.nsintIdentifier];
            [self.delegate removeViewController];
        }
    }
    /*END-CASE*/
}

- (void) removeKeyboard
{
    [self.view endEditing:YES];
}
@end
