//
//  SleepViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timer.h"

@interface SleepViewController : UIViewController

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *uilabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *uilabelBody;
@property (weak, nonatomic) IBOutlet UIImageView *uiimageviewIcon;
@property (weak, nonatomic) IBOutlet UILabel *uilabelAverage;
@property (weak, nonatomic) IBOutlet UILabel *uilabelNumberOfTries;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSave;

// Properties
@property (nonatomic, strong) Timer *timerGameTimer;
@property (nonatomic, strong) NSTimer *nstimerControlTimer;
@property NSInteger nsintNumberOfTriesTaken;
@property NSInteger const NSINT_MAX_NUMBER_OF_TRIES;
@property double doubleAverageReactionTime;
@property double doubleReactionTime;
@property (nonatomic, strong) NSMutableArray *nsmutablearrayReactionTimes;
@property (nonatomic, strong) NSString *strReactionTime;
@property (nonatomic, strong) NSString *strAverageReactionTime;
@property (nonatomic, strong) NSString *strNumberOfTriesTaken;
typedef enum {
    Start_Screen, Wait, Tap, Tapped_Too_Soon, Results, Partial_Results
} gameStates;
@property gameStates gameState;

// Action methods
- (IBAction)saveReactionTime:(id)sender;

@end
