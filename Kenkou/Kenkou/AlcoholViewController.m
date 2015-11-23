//
//  AlcoholViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "AlcoholViewController.h"

@interface AlcoholViewController ()

@end

@implementation AlcoholViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self populateAlcoholicDrinkMutableArray];
    
    self.popUpHelp = [[PopUpViewController alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *uibarbuttonitemRightButton =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:@selector(showInfoPopUp)];
    self.tabBarController.navigationItem.rightBarButtonItem = uibarbuttonitemRightButton;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table management methods

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlcoholicDrinkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Alcoholic Drink" forIndexPath:indexPath];
    
    NSManagedObject *nsmanagedobjectDrink = self.nsmutarrAlcoholicDrink[indexPath.row];
    
    cell.uilabelAlcoholicDrinkName.text = [nsmanagedobjectDrink valueForKey:@"drinkName"];
    cell.doubleAlcoholPercentage = [[nsmanagedobjectDrink valueForKey:@"alcoholPercentage"] doubleValue];
    cell.doubleVolume = [[nsmanagedobjectDrink valueForKey:@"volume"] doubleValue];
    cell.uilabelConsumptionMultiplicity.text = @"0";
    cell.nsintConsumptionMultiplicity = 0;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nsmutarrAlcoholicDrink.count;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertController *uialertcontrollerAlert = [UIAlertController alertControllerWithTitle:@"Borrar bebida"
                                                                       message:@"¿Deseas borrar la bebida?"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *uialertactionAccept = [UIAlertAction actionWithTitle:@"Si"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action)
        {
            // Delete the row from the data source and coredata
            AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
            NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
            [nsManagedObjectContext deleteObject:[self.nsmutarrAlcoholicDrink objectAtIndex:indexPath.row]];
            
            NSError *error = nil;
            if (
                ![nsManagedObjectContext save:&error]
                )
            {
                NSLog(@"Can't delete drink! %@ %@", error, [error localizedDescription]);
                return;
            }
            
            [self.nsmutarrAlcoholicDrink removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [uialertcontrollerAlert dismissViewControllerAnimated:YES completion:nil];
        }];
        
        UIAlertAction *uialertactionCancel = [UIAlertAction actionWithTitle:@"No"
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action)
        {
            [uialertcontrollerAlert dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [uialertcontrollerAlert addAction:uialertactionAccept];
        [uialertcontrollerAlert addAction:uialertactionCancel];
        
        [self presentViewController:uialertcontrollerAlert animated:YES completion:nil];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Borrar";
}

- (void)populateAlcoholicDrinkMutableArray
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    NSEntityDescription *nsEntityDescription =
    [NSEntityDescription entityForName:@"Drinks" inManagedObjectContext:nsManagedObjectContext];
    
    // A request is created
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // The entity for the request is specified
    [request setEntity: nsEntityDescription];
    
    NSError *error;
    
    // The request is executed
    NSArray *nsArrayMatchedObject = [nsManagedObjectContext executeFetchRequest: request error:&error];
    
    NSLog(@"Number of recorded drinks: %li", nsArrayMatchedObject.count);
    
    self.nsmutarrAlcoholicDrink = [[NSMutableArray alloc] initWithArray:nsArrayMatchedObject];
}

- (void)enableScrolling
{
    self.uitableviewAlcoholicDrinks.scrollEnabled = YES;
}

- (void)showInfoPopUp
{
    [self.popUpHelp showHelpAlcoholInView:self.view animated:YES];
    [self.popUpHelp showHelpAlcoholInView:self.view animated:YES]; // Temporary popup fix issue
    [self.popUpHelp assignScrollingDelegate:self];
    self.uitableviewAlcoholicDrinks.scrollEnabled = NO;
}

- (void)addAlcoholicDrinkWithName:(NSString *)name WithAlcoholPercentage:(double)percentage WithVolume:(double)volume
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    
    // Creates a new NSManagedObject for the data base
    NSManagedObject *nsmanagedobjectNewDrink =
    [NSEntityDescription insertNewObjectForEntityForName:@"Drinks" inManagedObjectContext:nsManagedObjectContext];
    
    // Assigns the values to the new managed object
    [nsmanagedobjectNewDrink setValue:name forKey:@"drinkName"];
    [nsmanagedobjectNewDrink setValue:[NSNumber numberWithDouble:percentage] forKey:@"alcoholPercentage"];
    [nsmanagedobjectNewDrink setValue:[NSNumber numberWithDouble:volume] forKey:@"volume"];
    
    // Tries to save the context to the database
    NSError *error;
    [nsManagedObjectContext save: &error];
    
    if (
        error == nil
        )
    {
        NSLog(@"Drink saved successfully!");
    }
    else
    {
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }
    
    [self populateAlcoholicDrinkMutableArray];
    [self.uitableviewAlcoholicDrinks reloadData];
}

- (IBAction)addAlcoholicDrink:(id)sender
{
    [self.popUpHelp showAlcoholAddAlcoholicDrink:self.view animated:YES];
    [self.popUpHelp showAlcoholAddAlcoholicDrink:self.view animated:YES]; // Temporary popup fix issue
    [self.popUpHelp assignAddAlcoholicDrinkDelegate:self];
    [self.popUpHelp assignScrollingDelegate:self];
    self.uitableviewAlcoholicDrinks.scrollEnabled = NO;
}

- (IBAction)saveRecord:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    NSEntityDescription *nsEntityDescription =
    [NSEntityDescription entityForName:@"Records" inManagedObjectContext:nsManagedObjectContext];
    
    // A request is created
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // The entity for the request is specified
    [request setEntity: nsEntityDescription];
    
    NSError *error;
    
    // The request is executed
    NSArray *nsArrayMatchedObject = [nsManagedObjectContext executeFetchRequest: request error:&error];
    
    NSLog(@"Number of recorded dates: %li", nsArrayMatchedObject.count);
    
    NSManagedObject *nsmanagedobjectRecord = [self getRecordInArray:nsArrayMatchedObject];
    
    if (
        nsmanagedobjectRecord
        )
    {
        [nsmanagedobjectRecord setValue:[NSNumber numberWithDouble:[self getTotalAlcoholGrams]] forKey:@"alcoholGrams"];
        
        // Tries to save the context to the database
        NSError *saveError;
        [nsManagedObjectContext save: &saveError];
        
        if (
            saveError == nil
            )
        {
            NSLog(@"Record saved successfully!");
        }
        else
        {
            NSLog(@"Can't save! %@ %@", saveError, [saveError localizedDescription]);
        }
    }
    else
    {
        NSLog(@"Record not found");
    }
}

- (double)getTotalAlcoholGrams
{
    double doubleTotalAlcoholGrams = 0;
    
    for (int intRow = 0; intRow < [self.uitableviewAlcoholicDrinks numberOfRowsInSection:0]; intRow++)
    {
        NSIndexPath* cellPath = [NSIndexPath indexPathForRow:intRow inSection:0];
        AlcoholicDrinkTableViewCell* cell = [self.uitableviewAlcoholicDrinks cellForRowAtIndexPath:cellPath];
        
        if (
            cell.nsintConsumptionMultiplicity > 0
            )
        {
            doubleTotalAlcoholGrams = doubleTotalAlcoholGrams + (cell.nsintConsumptionMultiplicity * ((cell.doubleVolume * cell.doubleAlcoholPercentage * 0.08) / 10));
        }
    }
    
    NSLog(@"%f", doubleTotalAlcoholGrams);
    
    return doubleTotalAlcoholGrams;
}

- (NSManagedObject *)getRecordInArray:(NSArray *)array
{
    NSLog(@"Retrieving record.");
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    NSDate *nsdateCurrentDate = [NSDate date];
    
    NSManagedObject *nsmanagedobjectSelectedRecord = nil;
    int intNSManagedObject = 0;
    
    /*WHILE-DO*/
    while (
           (intNSManagedObject < array.count) &&
           (nsmanagedobjectSelectedRecord == nil)
           )
    {
        NSManagedObject *nsmanagedobjectDate = array[intNSManagedObject];
        NSDate *nsdateComparisonDate = [nsmanagedobjectDate valueForKey:@"date"];
        
        if (
            [[dateFormatter stringFromDate:nsdateCurrentDate] isEqualToString:[dateFormatter stringFromDate:nsdateComparisonDate]]
            )
        {
            nsmanagedobjectSelectedRecord = nsmanagedobjectDate;
        }
        
        intNSManagedObject = intNSManagedObject + 1;
    }
    
    return nsmanagedobjectSelectedRecord;
}
@end
