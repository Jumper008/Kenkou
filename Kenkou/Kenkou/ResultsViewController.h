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

// Properties
@property (nonatomic, strong) NSString *strUsername;

// Action methods

@end
