//
//  SettingsTableViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/2/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "AppDelegate.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Configuración"];
    
    // Changes the back button item
    UIBarButtonItem *uibarbuttonitemBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Atrás" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = uibarbuttonitemBackButton;
    
    [self loadSettings];
    
//    // Modifies navigation bar back button
//    UIBarButtonItem *uibarbuttonitemBackButton =
//    [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationController.navigationItem.backBarButtonItem = uibarbuttonitemBackButton;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger nsintNumberOfRows;
    if (
        section == 0
        )
    {
        nsintNumberOfRows = 7;
    }
    else
    {
        nsintNumberOfRows = 2;
    }
    
    return nsintNumberOfRows;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeleteRecords" forIndexPath:indexPath];
//}

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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    SettingsViewController *settingsViewController = [segue destinationViewController];
    settingsViewController.delegate = self;
    
    /*CASE*/
    if (
        [[segue identifier] isEqualToString:@"nombre"]
        )
    {
        settingsViewController.strViewControllerTitle = @"Nombre";
        settingsViewController.strTextViewPlaceholder = self.lblFirstName.text;
        settingsViewController.keyboardType = UIKeyboardTypeAlphabet;
        settingsViewController.nsintIdentifier = 1;
    }
    else if (
        [[segue identifier] isEqualToString:@"apellido"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Apellido";
        settingsViewController.strTextViewPlaceholder = self.lblLastName.text;
        settingsViewController.keyboardType = UIKeyboardTypeAlphabet;
        settingsViewController.nsintIdentifier = 2;
    }
    else if (
             [[segue identifier] isEqualToString:@"añodenacimiento"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Año de Nacimiento";
        settingsViewController.strTextViewPlaceholder = self.lblBirthYear.text;
        settingsViewController.keyboardType = UIKeyboardTypeNumberPad;
        settingsViewController.nsintIdentifier = 3;
    }
    else if (
             [[segue identifier] isEqualToString:@"altura"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Altura";
        settingsViewController.strTextViewPlaceholder = [[NSString alloc] initWithFormat:@"%0.2f", self.flHeight];
        settingsViewController.keyboardType = UIKeyboardTypeDecimalPad;
        settingsViewController.nsintIdentifier = 4;
    }
    else if (
             [[segue identifier] isEqualToString:@"peso"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Peso";
        settingsViewController.strTextViewPlaceholder = [[NSString alloc] initWithFormat:@"%0.2f", self.flWeight];
        settingsViewController.keyboardType = UIKeyboardTypeDecimalPad;
        settingsViewController.nsintIdentifier = 5;
    }
    else
    {
        settingsViewController.strViewControllerTitle = @"Créditos";
        settingsViewController.strTextViewPlaceholder = @"Kenkou ha sido desarrollado por estudiantes del Tecnológico de Monterrey durante el semestre Agosto Diciembre de 2015 como parte del curso Proyecto de Desarrollo de Dispositivos Móviles y asesorados por la Maestra Yolanda Martínez Treviño.\n\nDesarrolladores:\nAlejandro Zamudio Guajardo\nYahaire Salazar Mireles\nJuan Carlos Olvera Uribe\n\nKenkou se distribuye como está, de manera gratuita y se prohíbe su distribución y uso con fines de lucro.";
        settingsViewController.uitextviewDataField.editable = NO;
        settingsViewController.nsintIdentifier = 6;
    }
    /*END-CASE*/
}

#pragma mark - Protocol: saveSettingFieldData methods

- (void) saveFieldWithData:(id)data withIdentifier:(NSInteger)identifier
// id:data is the piece of information obtained from SettingsViewController

// NSInteger:identifier identifies the context of (id:data)

// (NSInteger:identifier) possible values and meaning:
// 1 = First Name
// 2 = Last Name
// 3 = BirthYear
// 4 = Height
// 5 = Weight
{
    /*CASE*/
    if (
        identifier == 1
        )
    {
        self.strFirstName = (NSString *)data;
        self.lblFirstName.text = self.strFirstName;
    }
    else if (
        identifier == 2
        )
    {
        self.strLastName = (NSString *)data;
        self.lblLastName.text = self.strLastName;
    }
    else if (
        identifier == 3
             )
    {
        NSNumber *numData = [[NSNumber alloc] init];
        numData = data;
        self.nsintBirthYear = [numData integerValue];
        self.lblBirthYear.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintBirthYear];
    }
    else if (
        identifier == 4
        )
    {
        NSNumber *numData = [[NSNumber alloc] init];
        numData = data;
        self.flHeight = [numData floatValue];
        self.lblHeight.text = [[NSString alloc] initWithFormat:@"%0.2f m", self.flHeight];
    }
    else
    {
        NSNumber *numData = [[NSNumber alloc] init];
        numData = data;
        self.flWeight = [numData floatValue];
        self.lblWeight.text = [[NSString alloc] initWithFormat:@"%0.2f kg", self.flWeight];
    }
    /*END-CASE*/
}

#pragma mark - CoreData methods

- (void) loadSettings
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    NSEntityDescription *nsEntityDescription =
                            [NSEntityDescription entityForName:@"User" inManagedObjectContext:nsManagedObjectContext];
    
    // A request is created
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // The entity for the request is specified
    [request setEntity: nsEntityDescription];
    
    NSError *error;
    
    // The request is executed
    NSArray *nsArrayMatchedObject = [nsManagedObjectContext executeFetchRequest: request error:&error];
    
    NSLog(@"%li", (unsigned long)nsArrayMatchedObject.count);
    
    if (
        error == nil
        )
    {
        NSLog(@"Settings loaded successfully!");
        
        // Obtains user information
        NSManagedObject *nsManagedObjectUser = nsArrayMatchedObject[0];
        
        // Updates TableViewController's labels, switch and segmented control
        self.lblFirstName.text = [nsManagedObjectUser valueForKey:@"firstName"];
        self.lblLastName.text = [nsManagedObjectUser valueForKey:@"lastName"];
        self.lblBirthYear.text = [[nsManagedObjectUser valueForKey:@"birthYear"] stringValue];
        self.lblHeight.text = [[nsManagedObjectUser valueForKey:@"height"] stringValue];
        self.lblHeight.text = [self.lblHeight.text stringByAppendingString:@" m"];
        self.flHeight = [[nsManagedObjectUser valueForKey:@"height"] floatValue];
        self.lblWeight.text = [[nsManagedObjectUser valueForKey:@"weight"] stringValue];
        self.lblWeight.text = [self.lblWeight.text stringByAppendingString:@" kg"];
        self.flWeight = [[nsManagedObjectUser valueForKey:@"weight"] floatValue];
        self.uisegmentedcontrolSex.selectedSegmentIndex = [[nsManagedObjectUser valueForKey:@"sex"] integerValue];
        self.uiswitchExercise.on = [[nsManagedObjectUser valueForKey:@"exercise"] boolValue];
    }
    else
    {
        NSLog(@"Can't load! %@ %@", error, [error localizedDescription]);
    }
}

- (IBAction)saveSettings:(id)sender
{
    BOOL boolIsFieldDataCorrect = YES;
    NSString *strAlertTitle;
    NSString *strAlertMessage = @"Por favor modifique el valor.";
    
    /*CASE*/
    if (
        [self.lblFirstName.text isEqualToString:@""]
        )
    {
        boolIsFieldDataCorrect = NO;
        strAlertTitle = @"Nombre inválido";
    }
    else if (
        [self.lblLastName.text isEqualToString:@""]
        )
    {
        boolIsFieldDataCorrect = NO;
        strAlertTitle = @"Apellido inválido";
    }
    else if (
        [self.lblBirthYear.text isEqualToString:@""]
        )
    {
        boolIsFieldDataCorrect = NO;
        strAlertTitle = @"Año de nacimiento inválido";
    }
    else if (
        [self.lblHeight.text isEqualToString:@""]
        )
    {
        boolIsFieldDataCorrect = NO;
        strAlertTitle = @"Altura inválido";
    }
    else if (
        [self.lblWeight.text isEqualToString:@""]
        )
    {
        boolIsFieldDataCorrect = NO;
        strAlertTitle = @"Peso inválido";
    }
    /*END-CASE*/
    
    if (
        boolIsFieldDataCorrect
        )
    {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
        NSEntityDescription *nsEntityDescription =
                            [NSEntityDescription entityForName:@"User" inManagedObjectContext:nsManagedObjectContext];
        
        // A request is created
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        // The entity for the request is specified
        [request setEntity: nsEntityDescription];
        
        NSError *fetchRequestError;
        
        // The request is executed
        NSArray *nsArrayMatchedObject = [nsManagedObjectContext executeFetchRequest: request error:&fetchRequestError];
        
        if (
            fetchRequestError == nil
            )
        {
            NSManagedObject *nsmanagedobjectUser = nsArrayMatchedObject[0];
            
            // Assigns the values to the managed object
            [nsmanagedobjectUser setValue:self.lblFirstName.text forKey:@"firstName"];
            [nsmanagedobjectUser setValue:self.lblLastName.text forKey:@"lastName"];
            NSInteger nsintBirthYear = [self.lblBirthYear.text integerValue];
            [nsmanagedobjectUser setValue:[NSNumber numberWithInteger:nsintBirthYear] forKey:@"birthYear"];
            [nsmanagedobjectUser setValue:[NSNumber numberWithFloat:self.flHeight] forKey:@"height"];
            [nsmanagedobjectUser setValue:[NSNumber numberWithFloat:self.flWeight] forKey:@"weight"];
            NSInteger nsintSex = self.uisegmentedcontrolSex.selectedSegmentIndex;
            [nsmanagedobjectUser setValue:[NSNumber numberWithInteger:nsintSex] forKey:@"sex"];
            [nsmanagedobjectUser setValue:[NSNumber numberWithBool:self.uiswitchExercise.on] forKey:@"exercise"];
            
            // Tries to save the context to the database
            NSError *saveError;
            [nsManagedObjectContext save: &saveError];
            
            if (
                saveError == nil
                )
            {
                NSLog(@"User saved successfully!");
                
                [self.delegate removeViewController];
            }
            else
            {
                NSLog(@"Can't save! %@ %@", saveError, [saveError localizedDescription]);
            }
        }
        else
        {
            NSLog(@"Can't load! %@ %@", fetchRequestError, [fetchRequestError localizedDescription]);
        }
        
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:strAlertTitle
                                                                       message:strAlertMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void) removeViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
