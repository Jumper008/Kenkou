//
//  FoodClassificationTableViewController.m
//  Kenkou
//
//  Created by Nelly on 22/11/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "FoodClassificationTableViewController.h"
#import "FoodItem.h"

@interface FoodClassificationTableViewController ()

@end

@implementation FoodClassificationTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Clasificación de Alimentos"];
    
    self.uisearchbarSearch.barTintColor = [UIColor whiteColor];
    self.uisearchbarSearch.tintColor = [self colorWithHexString:@"FF7160"];
    
    self.nsarrayFoodItems = [NSArray arrayWithObjects:
                             [FoodItem foodItemOfName:@"Leche" IsFruitOrVeggie:NO IsCereal:NO IsSugar:NO IsFat:YES IsCalciumRich:YES],
                             [FoodItem foodItemOfName:@"Hamburguesa" IsFruitOrVeggie:NO IsCereal:NO IsSugar:NO IsFat:YES IsCalciumRich:NO],
                             [FoodItem foodItemOfName:@"Tomate" IsFruitOrVeggie:YES IsCereal:NO IsSugar:NO IsFat:NO IsCalciumRich:NO],
                             [FoodItem foodItemOfName:@"Aguacate" IsFruitOrVeggie:YES IsCereal:NO IsSugar:NO IsFat:NO IsCalciumRich:NO],
                             nil];
    
    self.nsmutablearrayFilteredFood = [NSMutableArray arrayWithCapacity:[self.nsarrayFoodItems count]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (
        tableView == self.searchDisplayController.searchResultsTableView
        || self.bShowFilteredArray)
    {
        return [self.nsmutablearrayFilteredFood count];
    } else {
        return [self.nsarrayFoodItems count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (
        cell == nil
        )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Create a new FoodItem Object
    FoodItem *fooditemFood = nil;

    // Check to see whether the normal table or search results table is being displayed and set the FoodItem object from the appropriate array
    if (
        tableView == self.searchDisplayController.searchResultsTableView
        || self.bShowFilteredArray
        )
    {
        fooditemFood = [self.nsmutablearrayFilteredFood objectAtIndex:indexPath.row];
    } else {
        fooditemFood = [self.nsarrayFoodItems objectAtIndex:indexPath.row];
    }
    
    // Configure the cell
    cell.textLabel.text = fooditemFood.strName;
    cell.textLabel.textColor = [self colorWithHexString:@"#939393"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
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

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.nsmutablearrayFilteredFood removeAllObjects];
    // Filter the array using NSPredicate
    
    NSArray *nsarrayUnscopedFoodList = [[NSArray alloc] init];
    
    if (
        [searchText isEqualToString:@""]
        )
    {
        nsarrayUnscopedFoodList = self.nsarrayFoodItems;
    }
    else
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.strName contains[c] %@",searchText];
        
        nsarrayUnscopedFoodList = [self.nsarrayFoodItems filteredArrayUsingPredicate:predicate];
    }
    
    if (
        ![scope isEqualToString:@"Todo"]
        )
    {
        NSPredicate *nspredicateScope = [[NSPredicate alloc] init];
        
        // Check which scope to use
        if (
            [scope isEqualToString:@"Fru./Ver."]
            )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bFruitOrVegetable == YES"];
        }
        else if (
                 [scope isEqualToString:@"Cereales"]
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bCereal == YES"];
        }
        else if (
                 [scope isEqualToString:@"Azucares"]
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bSugar == YES"];
        }
        else if (
                 [scope isEqualToString:@"Grasas"]
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bFat == YES"];
        }
        else if (
                 [scope isEqualToString:@"Calcio"]
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bCalciumRich == YES"];
        }
        
        NSArray *nsarrayScopedFoodList = [nsarrayUnscopedFoodList filteredArrayUsingPredicate:nspredicateScope];
        
        
        
        self.nsmutablearrayFilteredFood = [NSMutableArray arrayWithArray:nsarrayScopedFoodList];
    }
    else
    {
        self.nsmutablearrayFilteredFood = [NSMutableArray arrayWithArray:nsarrayUnscopedFoodList];
    }
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Do scope search without search text
    if (
        searchOption != 0
        && [self.uisearchbarSearch.text isEqualToString:@""]
        )
    {
        self.bShowFilteredArray = YES;
        NSArray *nsarrayUnscopedFoodList = self.nsarrayFoodItems;
        
        NSPredicate *nspredicateScope = [[NSPredicate alloc] init];
        
        // Check which scope to use
        if (
            searchOption == 1
            )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bFruitOrVegetable == YES"];
        }
        else if (
                 searchOption == 2
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bCereal == YES"];
        }
        else if (
                 searchOption == 3
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bSugar == YES"];
        }
        else if (
                 searchOption == 4
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bFat == YES"];
        }
        else if (
                 searchOption == 5
                 )
        {
            nspredicateScope = [NSPredicate predicateWithFormat:@"SELF.bCalciumRich == YES"];
        }
        
        NSArray *nsarrayScopedFoodList = [nsarrayUnscopedFoodList filteredArrayUsingPredicate:nspredicateScope];
        
        
        
        self.nsmutablearrayFilteredFood = [NSMutableArray arrayWithArray:nsarrayScopedFoodList];
    }
    else
    {
        self.bShowFilteredArray = NO;
    }
    
    [self.tableView reloadData];
    
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


@end
