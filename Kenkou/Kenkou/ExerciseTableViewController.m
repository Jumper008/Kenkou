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
    self.nsintAerobicMinutes = 0;
    self.nsintAnaerobicMinutes = 0;
    
    self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", self.nsintAerobicMinutes];
    self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", self.nsintAnaerobicMinutes];
    
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
        self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", self.nsintAerobicMinutes];
    }
    else
    {
        self.nsintAnaerobicMinutes = self.nsintAnaerobicMinutes + 5;
        self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", self.nsintAnaerobicMinutes];
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
            self.uitextfieldAerobic.text = [[NSString alloc] initWithFormat:@"%li", self.nsintAerobicMinutes];
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
            self.uitextfieldAnaerobic.text = [[NSString alloc] initWithFormat:@"%li", self.nsintAnaerobicMinutes];
        }
        else
        {
            // Does nothing
        }
    }
}
@end