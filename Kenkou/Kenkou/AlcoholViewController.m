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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *uibarbuttonitemRightButton =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:nil];
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
    
    NSString *strName = self.nsmutarrAlcoholicDrink[indexPath.row];
    
    cell.uilabelAlcoholicDrinkName.text = strName;
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
        // Delete the row from the data source
        [self.nsmutarrAlcoholicDrink removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)populateAlcoholicDrinkMutableArray
{
    self.nsmutarrAlcoholicDrink = [NSMutableArray arrayWithObjects:@"Vodka", @"Cerveza", nil];
}

@end
