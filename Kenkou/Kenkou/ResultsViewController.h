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
@property (weak, nonatomic) IBOutlet UISegmentedControl *uisegmentedcontrolPlotFocus;
@property (weak, nonatomic) IBOutlet UILabel *uilabelScore;
@property (weak, nonatomic) IBOutlet UIView *uiviewSpiderPlotView;

// Properties
@property (nonatomic, strong) BTSpiderPlotterView *spiderView;
@property (nonatomic, strong) NSString *strUsername;
@property BOOL boolIsUserFemale;
@property double doubleGeneralScore;
@property (nonatomic, strong) UIColor *uicolorRedColor;
@property (nonatomic, strong) UIColor *uicolorGreenColor;
@property (nonatomic, strong) UIColor *uicolorYellowColor;

// Action methods

@end
