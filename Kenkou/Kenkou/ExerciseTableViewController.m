//
//  ExerciseTableViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/16/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "ExerciseTableViewController.h"

@interface ExerciseTableViewController ()

@end

@implementation ExerciseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize aerobic and anaerobic minute counters and text fields
    [self loadExerciseValues];
    
    self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAerobicMinutes];
    self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAnaerobicMinutes];
    
    self.uibuttonSave.layer.cornerRadius = 20.0f;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
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
        nsintNumberOfRows = 2;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addMinutes:(UIButton *)sender
{
    if (
        sender == self.uibuttonAddAerobicMinutes
        )
    {
        self.nsintAerobicMinutes = self.nsintAerobicMinutes + 5;
        self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAerobicMinutes];
    }
    else
    {
        self.nsintAnaerobicMinutes = self.nsintAnaerobicMinutes + 5;
        self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAnaerobicMinutes];
    }
}

- (IBAction)substractMinutes:(UIButton *)sender
{
    if (
        sender == self.uibuttonSubstractAerobicMinutes
        )
    {
        if (
            self.nsintAerobicMinutes > 0
            )
        {
            self.nsintAerobicMinutes = self.nsintAerobicMinutes - 5;
            self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAerobicMinutes];
        }
        else
        {
            // Does nothing
        }
    }
    else
    {
        if (
            self.nsintAnaerobicMinutes > 0
            )
        {
            self.nsintAnaerobicMinutes = self.nsintAnaerobicMinutes - 5;
            self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAnaerobicMinutes];
        }
        else
        {
            // Does nothing
        }
    }
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
    
    NSLog(@"Number of recorded dates: %li", (unsigned long)nsArrayMatchedObject.count);
    
    NSManagedObject *nsmanagedobjectRecord = [self getRecordInArray:nsArrayMatchedObject];
    
    if (
        nsmanagedobjectRecord
        )
    {
        NSInteger nsintAerobicTime = self.nsintAerobicMinutes;
        NSInteger nsintAnaerobicTime = self.nsintAnaerobicMinutes;
        
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintAerobicTime] forKey:@"aerobicTime"];
        [nsmanagedobjectRecord setValue:[NSNumber numberWithInteger:nsintAnaerobicTime] forKey:@"anaerobicTime"];
        
        // Tries to save the context to the database
        NSError *saveError;
        [nsManagedObjectContext save: &saveError];
        
        if (
            saveError == nil
            )
        {
            NSLog(@"Record saved successfully!");
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"¡Éxito!"
                                                                           message:@"Los valores se han guardado exitosamente."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
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

- (void)loadExerciseValues
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
    
    NSLog(@"Number of recorded dates: %li", (unsigned long)nsArrayMatchedObject.count);
    
    NSManagedObject *nsmanagedobjectRecord = [self getRecordInArray:nsArrayMatchedObject];
    
    if (
        nsmanagedobjectRecord
        )
    {
        self.nsintAerobicMinutes = [[nsmanagedobjectRecord valueForKey:@"aerobicTime"] integerValue];
        self.nsintAnaerobicMinutes = [[nsmanagedobjectRecord valueForKey:@"anaerobicTime"] integerValue];
        self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAerobicMinutes];
        self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", (long)self.nsintAnaerobicMinutes];
    }
    else
    {
        NSLog(@"Record not found");
    }
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
