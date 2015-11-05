//
//  SettingsTableViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/2/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Configuración"];
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
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
    
    SettingsViewController *settingsViewController = [segue destinationViewController];
    settingsViewController.delegate = self;
    
    if (
        [[segue identifier] isEqualToString:@"nombre"]
        )
    {
        settingsViewController.strViewControllerTitle = @"Nombre";
        settingsViewController.strTextViewPlaceholder = @"Juan";
        settingsViewController.keyboardType = UIKeyboardTypeAlphabet;
        settingsViewController.nsintIdentifier = 1;
    }
    else if (
        [[segue identifier] isEqualToString:@"apellido"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Apellido";
        settingsViewController.strTextViewPlaceholder = @"Camaney";
        settingsViewController.keyboardType = UIKeyboardTypeAlphabet;
        settingsViewController.nsintIdentifier = 2;
    }
    else if (
             [[segue identifier] isEqualToString:@"añodenacimiento"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Año de Nacimiento";
        settingsViewController.strTextViewPlaceholder = @"1994";
        settingsViewController.keyboardType = UIKeyboardTypeNumberPad;
        settingsViewController.nsintIdentifier = 3;
    }
    else if (
             [[segue identifier] isEqualToString:@"altura"]
             )
    {
        settingsViewController.strViewControllerTitle = @"Altura";
        settingsViewController.strTextViewPlaceholder = @"1.75";
        settingsViewController.keyboardType = UIKeyboardTypeDecimalPad;
        settingsViewController.nsintIdentifier = 4;
    }
    else
    {
        settingsViewController.strViewControllerTitle = @"Peso";
        settingsViewController.strTextViewPlaceholder = @"85.5";
        settingsViewController.keyboardType = UIKeyboardTypeDecimalPad;
        settingsViewController.nsintIdentifier = 5;
    }
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

- (void) removeViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
