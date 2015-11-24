//
//  FoodClassificationTableViewController.h
//  Kenkou
//
//  Created by Nelly on 22/11/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodClassificationTableViewCell.h"

@interface FoodClassificationTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

// Outlets
@property (weak, nonatomic) IBOutlet UISearchBar *uisearchbarSearch;

// Action Methods

// Properties
@property (strong, nonatomic) NSArray *nsarrayFoodDictionary;
@property (strong, nonatomic) NSMutableArray *nsmutablearrayFoodItems;
@property (strong, nonatomic) NSMutableArray *nsmutablearrayFilteredFood;
@property BOOL bShowFilteredArray;

@end
