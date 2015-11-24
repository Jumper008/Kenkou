//
//  ResultsViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 10/22/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTSpiderPlotterView.h"
#import "AppDelegate.h"

@interface ResultsViewController : UIViewController

// Outlets.
@property (nonatomic, strong) BTSpiderPlotterView *spiderView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolPlotFocus;
@property (weak, nonatomic) IBOutlet UILabel *uilabelScore;

// Properties
@property (nonatomic, strong) NSString *strUsername;
@property BOOL boolIsUserFemale;
@property double doubleGeneralScore;

// Action methods

@end
