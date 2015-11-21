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

- (void)populateAlcoholicDrinkMutableArray
{
    self.nsmutarrAlcoholicDrink = [NSMutableArray arrayWithObjects:@"Vodka", @"Cerveza", nil];
}

@end