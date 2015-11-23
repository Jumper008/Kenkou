//
//  MainTableViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/12/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popUpUnderDevelopment = [[PopUpViewController alloc] init];
    
    [self setMainTitle];
    
    // Changes the back button item
    UIBarButtonItem *uibarbuttonitemBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = uibarbuttonitemBackButton;
    
    
    
    // Changes the navigation bar color
    [self.navigationController.navigationBar setBarTintColor:[self colorWithHexString:@"FF7160"]];
    
    // Changes the navigation bar title's color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    // Changes the back button item color
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    // Modifies the status bar style to light content
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
//    // Modifies navigation bar back button
//    UIBarButtonItem *uibarbuttonitemBackButton =
//    [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationController.navigationItem.backBarButtonItem = uibarbuttonitemBackButton;
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"Back-25"];
//    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"Back-25"];
    
    self.uibuttonRegister.layer.cornerRadius = 20.0f;
    self.uibuttonResults.layer.cornerRadius = 20.0f;
    self.uibuttonMyProgress.layer.cornerRadius = 20.0f;
    self.uibuttonFoodClassification.layer.cornerRadius = 20.0f;
    
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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
    
    if (
        [[segue identifier] isEqualToString:@"Settings"]
        )
    {
        SettingsTableViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.delegate = self;
    }
    else if (
        [[segue identifier] isEqualToString:@"Recording"]
        )
    {
        [self registerDayRecordInCoreData];
    }
}

- (void)setMainTitle
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
    
    NSLog(@"%li", nsArrayMatchedObject.count);
    
    if (
        error == nil
        )
    {
        NSLog(@"User record loaded successfully!");
        
        // Obtains user information
        NSManagedObject *nsManagedObjectUser = nsArrayMatchedObject[0];
        
        NSString *strTitle;
        
        if (
            [[nsManagedObjectUser valueForKey:@"sex"] integerValue] == 0
            )
        {
            strTitle = @"Bienvenido, ";
        }
        else
        {
            strTitle = @"Bienvenida, ";
        }
        
        strTitle = [strTitle stringByAppendingString:[nsManagedObjectUser valueForKey:@"firstName"]];
        
        [self setTitle:strTitle];
    }
    else
    {
        NSLog(@"Can't load! %@ %@", error, [error localizedDescription]);
    }
}

- (void)registerDayRecordInCoreData
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
    
    if (
        [self checkForDateExistenceInArray:nsArrayMatchedObject]
        )
    {
        NSLog(@"Date already recorded");
        // Does nothing
    }
    else
    {
        // Creates a new NSManagedObject for the data base
        NSManagedObject *nsmanagedobjectNewRecord =
        [NSEntityDescription insertNewObjectForEntityForName:@"Records" inManagedObjectContext:nsManagedObjectContext];
        
        // Assigns the values to the new managed object
        [nsmanagedobjectNewRecord setValue:[NSDate date] forKey:@"date"];
        
        NSInteger nsintDefaultFoodCategoryValue = 1;
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"fruitsAndVegetables"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"cereals"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"sugars"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"fats"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"calcium"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"salts"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"water"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"eatingResponsibly1"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"eatingResponsibly2"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultFoodCategoryValue] forKey:@"eatingResponsibly3"];
        
        NSInteger nsintDefaultExerciseValue = 0;
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultExerciseValue] forKey:@"aerobicTime"];
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithInteger:nsintDefaultExerciseValue] forKey:@"anaerobicTime"];
        
        double doubleDefaultReactionTimeValue = 0.0;
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithDouble:doubleDefaultReactionTimeValue] forKey:@"averageReactionTime"];
        
        double doubleDefaultAlcoholGramsValue = 0.0;
        [nsmanagedobjectNewRecord setValue:[NSNumber numberWithDouble:doubleDefaultAlcoholGramsValue] forKey:@"alcoholGrams"];
        
        // Tries to save the context to the database
        NSError *error;
        [nsManagedObjectContext save: &error];
        
        if (
            error == nil
            )
        {
            NSLog(@"Date recorded successfully!");
        }
        else
        {
            NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
        }
    }
}

- (BOOL)checkForDateExistenceInArray:(NSArray *)array
{
    NSLog(@"Checking date existence.");
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    NSDate *nsdateCurrentDate = [NSDate date];
    
    BOOL boolIsDateAlreadyRecorded = NO;
    
    for (int intNSManagedObject = 0; intNSManagedObject < array.count; intNSManagedObject++)
    {
        NSManagedObject *nsmanagedobjectDate = array[intNSManagedObject];
        NSDate *nsdateComparisonDate = [nsmanagedobjectDate valueForKey:@"date"];
        
        if (
            [[dateFormatter stringFromDate:nsdateCurrentDate] isEqualToString:[dateFormatter stringFromDate:nsdateComparisonDate]]
            )
        {
            boolIsDateAlreadyRecorded = YES;
            
        }
    }
    
    return boolIsDateAlreadyRecorded;
}

// Converts a string to UIColor
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (void) removeViewController
{
    [self.navigationController popViewControllerAnimated:YES];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Configuraciones guardas"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    [self setMainTitle];
}

- (void)enableScrolling
{
    self.tableView.scrollEnabled = YES;
}

- (IBAction)showUnderDevelopmentPopUp:(id)sender
{
    [self.popUpUnderDevelopment showUnderDevelopmentInView:self.view animated:YES];
    [self.popUpUnderDevelopment assignScrollingDelegate:self];
    self.tableView.scrollEnabled = NO;
}
@end
