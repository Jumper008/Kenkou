//
//  OnboardingSettingsTableViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/12/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "OnboardingSettingsTableViewController.h"
#import "AppDelegate.h"

@interface OnboardingSettingsTableViewController ()

@end

@implementation OnboardingSettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flHeight = 1.75f;
    self.flWeight = 75.5f;
    
    self.uitextfieldFirstName.delegate = (id)self;
    self.uitextfieldLastName.delegate = (id)self;
    self.uitextfieldBirthYear.delegate = (id)self;
    self.uitextfieldHeight.delegate = (id)self;
    self.uitextfieldWeight.delegate = (id)self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(textFieldTextDidChange:)
                                          name:UITextFieldTextDidChangeNotification
                                          object:nil];
    
    self.uibuttonSave.layer.cornerRadius = 20.0f;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // Enables tapping to remove keyboard
    UITapGestureRecognizer *OffKeyboardtap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKeyboard)];
    [self.view addGestureRecognizer:OffKeyboardtap];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger nsintNumberOfRows;
    if (
        section == 0
        )
    {
        nsintNumberOfRows = 7;
    }
    else
    {
        nsintNumberOfRows = 1;
    }
    
    return nsintNumberOfRows;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    
    // Creates a new NSManagedObject for the data base
    NSManagedObject *nsmanagedobjectNewUser =
            [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:nsManagedObjectContext];
    
    // Assigns the values to the new managed object
    [nsmanagedobjectNewUser setValue:self.uitextfieldFirstName.text forKey:@"firstName"];
    [nsmanagedobjectNewUser setValue:self.uitextfieldLastName.text forKey:@"lastName"];
    NSInteger nsintBirthYear = [self.uitextfieldBirthYear.text integerValue];
    [nsmanagedobjectNewUser setValue:[NSNumber numberWithInteger:nsintBirthYear] forKey:@"birthYear"];
    [nsmanagedobjectNewUser setValue:[NSNumber numberWithFloat:self.flHeight] forKey:@"height"];
    [nsmanagedobjectNewUser setValue:[NSNumber numberWithFloat:self.flWeight] forKey:@"weight"];
    NSInteger nsintSex = self.uisegmentedcontrolSex.selectedSegmentIndex;
    [nsmanagedobjectNewUser setValue:[NSNumber numberWithInteger:nsintSex] forKey:@"sex"];
    [nsmanagedobjectNewUser setValue:[NSNumber numberWithBool:self.uiswitchExercise.on] forKey:@"exercise"];
    
    // Tries to save the context to the database
    NSError *error;
    [nsManagedObjectContext save: &error];
    
    if (
        error == nil
        )
    {
        NSLog(@"User saved successfully!");
    }
    else
    {
        NSLog(@"%@", error);
    }
}

// Returns YES if given segue must perform, or NO otherwise
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    BOOL boolShouldPerformSegue = YES;
    NSString *strAlertTitle;
    NSString *strAlertMessage = @"Por favor modifique el valor.";
    
    /*CASE*/
    if (
        [self.uitextfieldFirstName.text isEqualToString:@""]
        )
    {
        strAlertTitle = @"Nombre inválido";
        boolShouldPerformSegue = NO;
    }
    else if (
        [self.uitextfieldLastName.text isEqualToString:@""]
        )
    {
        strAlertTitle = @"Apellido inválido";
        boolShouldPerformSegue = NO;
    }
    else if (
        [self.uitextfieldBirthYear.text isEqualToString:@""]
        )
    {
        strAlertTitle = @"Año de nacimiento inválido";
        boolShouldPerformSegue = NO;
    }
    else if (
        [self.uitextfieldHeight.text isEqualToString:@""]
        )
    {
        strAlertTitle = @"Altura inválida";
        boolShouldPerformSegue = NO;
    }
    else if (
        [self.uitextfieldWeight.text isEqualToString:@""]
        )
    {
        strAlertTitle = @"Peso inválido";
        boolShouldPerformSegue = NO;
    }
    /*END-CASE*/
    
    if (
        boolShouldPerformSegue
        )
    {
        // Does nothing
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:strAlertTitle
                                                      message:strAlertMessage
                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                      style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    return boolShouldPerformSegue;
}

// Activates when a textfield has been selected
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (
        textField == self.uitextfieldHeight
        )
    {
        textField.text = [[NSString alloc] initWithFormat:@"%0.2f", self.flHeight];
    }
    else if (
        textField == self.uitextfieldWeight
        )
    {
        textField.text = [[NSString alloc] initWithFormat:@"%0.2f", self.flWeight];
    }
}

// Activates when a textfield has been deselected
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (
        textField == self.uitextfieldHeight
        )
    {
        self.flHeight = [textField.text floatValue];
        textField.text = [[NSString alloc] initWithFormat:@"%0.2f m", self.flHeight];
    }
    else if (
        textField == self.uitextfieldWeight
        )
    {
        self.flWeight = [textField.text floatValue];
        textField.text = [[NSString alloc] initWithFormat:@"%0.2f kg", self.flWeight];
    }
}

// Returns YES if the selected text field has valid data, returns NO otherwise
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    BOOL boolShouldTextFieldEndEditing = YES;
    NSString *strAlertTitle;
    NSString *strAlertMessage = @"Por favor modifique el valor.";
    
    /*CASE*/
    if (
        textField == self.uitextfieldFirstName
        )
    {
        boolShouldTextFieldEndEditing = YES;
    }
    else if (
        textField == self.uitextfieldLastName
        )
    {
        boolShouldTextFieldEndEditing = YES;
    }
    else if (
        textField == self.uitextfieldBirthYear
        )
    {
        if (
            ([self.uitextfieldBirthYear.text integerValue] > 2000) ||
            ([self.uitextfieldBirthYear.text integerValue] < 1985)
            )
        {
            strAlertTitle = @"Año de nacimiento inválido";
            boolShouldTextFieldEndEditing = NO;
        }
        else
        {
            boolShouldTextFieldEndEditing = YES;
        }
    }
    else if (
        textField == self.uitextfieldHeight
        )
    {
        if (
            (self.flHeight > 2.15f) ||
            (self.flHeight < 1.00f)
            )
        {
            strAlertTitle = @"Altura inválida";
            boolShouldTextFieldEndEditing = NO;
        }
        else
        {
            boolShouldTextFieldEndEditing = YES;
        }
    }
    else if (
        textField == self.uitextfieldWeight
        )
    {
        if (
            (self.flWeight > 150.00f) ||
            (self.flWeight < 20.00f)
            )
        {
            strAlertTitle = @"Peso inválido";
            boolShouldTextFieldEndEditing = NO;
        }
        else
        {
            boolShouldTextFieldEndEditing = YES;
        }
    }
    /*END-CASE*/
    
    if (
        boolShouldTextFieldEndEditing
        )
    {
        // Does nothing
    }
    else if (
        self.presentedViewController == nil
        )
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:strAlertTitle
                                                      message:strAlertMessage
                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                      style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    return boolShouldTextFieldEndEditing;
}

// Returns YES if the given textfield should do something when Return button in keyboard is pressed, and NO otherwise
// It also changes the Keyboard Focus (First Responder) depending on the textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (
        textField == self.uitextfieldFirstName
        )
    {
        [self.uitextfieldLastName becomeFirstResponder];
    }
    else if (
        textField == self.uitextfieldLastName
        )
    {
        [self.uitextfieldBirthYear becomeFirstResponder];
    }
    
    return YES;
}

- (void)textFieldTextDidChange:(NSNotification *)Notification
{
    if (
        Notification.object == self.uitextfieldHeight
        )
    {
        self.flHeight = [((UITextField *)Notification.object).text floatValue];
    }
    else if (
        Notification.object == self.uitextfieldWeight
        )
    {
        self.flWeight = [((UITextField *)Notification.object).text floatValue];
    }
}

- (void) removeKeyboard
{
    [self.view endEditing:YES];
}

@end