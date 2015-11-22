//
//  SleepViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "SleepViewController.h"

@interface SleepViewController ()

@end

@implementation SleepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.NSINT_MAX_NUMBER_OF_TRIES = 5;
    self.nsintNumberOfTriesTaken = 0;
    self.doubleReactionTime = 0;
    self.gameState = Start_Screen;
    self.uibuttonSave.enabled = NO;
    self.uibuttonSave.hidden = YES;
    self.popUpHelp = [[PopUpViewController alloc] init];
    
    self.timerGameTimer = [[Timer alloc] initTimer];
    
    self.nsmutablearrayReactionTimes = [[NSMutableArray alloc] init];
    
    // Adds tap recognizer for user interaction with game
    self.uitapgesturerecognizerUserTap = [[UITapGestureRecognizer alloc] init];
    self.uitapgesturerecognizerUserTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userDidTap)];
    [self.view addGestureRecognizer:self.uitapgesturerecognizerUserTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *uibarbuttonitemRightButton =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:@selector(showInfoPopUp)];
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

- (void)userDidTap
{
    /*CASE*/
    if (
        self.gameState == Start_Screen
        )
    {
        // Changes gameState to Wait
        self.gameState = Wait;
        
        // Change background to bloody red
        self.view.backgroundColor = [self colorWithHexString:@"A20900"];
        
        self.uilabelTitle.text = @"Espera al verde...";
        self.uilabelBody.text = @"";
        self.uiimageviewIcon.image = [UIImage imageNamed:@"wait-100"];
        
        // Starts game control timer
        self.nstimerControlTimer = [self startTimer];
    }
    else if (
        self.gameState == Wait
        )
    {
        // Changes gameState to Tapped_Too_Soon
        self.gameState = Tapped_Too_Soon;
        
        // Change background to darker blue
        self.view.backgroundColor = [self colorWithHexString:@"456A92"];
        
        self.uilabelTitle.text = @"¡Muy pronto!";
        self.uilabelBody.text = @"Toca para intentar otra vez.";
        self.uiimageviewIcon.image = [UIImage imageNamed:@"too-soon-100"];
    }
    else if (
        self.gameState == Tap
        )
    {
        // Stops timer
        [self.timerGameTimer stopTimer];
        
        self.nsintNumberOfTriesTaken = self.nsintNumberOfTriesTaken + 1;
        
        if (
            self.nsintNumberOfTriesTaken == self.NSINT_MAX_NUMBER_OF_TRIES
            )
        {
            // Changes gameState to Results
            self.gameState = Results;
            
            self.uilabelBody.text = @"Toca para jugar de nuevo o presiona el botón para guardar tu resultado.";
            self.uibuttonSave.enabled = YES;
            self.uibuttonSave.hidden = NO;
        }
        else
        {
            // Changes gameState to Partial_Results
            self.gameState = Partial_Results;
            
            self.uilabelBody.text = @"Toca para continuar";
        }
        
        // Change background to darker blue
        self.view.backgroundColor = [self colorWithHexString:@"456A92"];
        
        [self updateGameValues];
        
        self.uilabelTitle.text = self.strReactionTime;
        self.uilabelAverage.text = self.strAverageReactionTime;
        self.uilabelNumberOfTries.text = self.strNumberOfTriesTaken;
        self.uiimageviewIcon.image = [UIImage imageNamed:@"Time-100"];
    }
    else if (
        self.gameState == Tapped_Too_Soon
        )
    {
        // Changes gameState to Wait
        self.gameState = Wait;
        
        // Change background to bloody red
        self.view.backgroundColor = [self colorWithHexString:@"A20900"];
        
        self.uilabelTitle.text = @"Espera...";
        self.uilabelBody.text = @"";
        self.uiimageviewIcon.image = [UIImage imageNamed:@"wait-100"];
        
        [self.nstimerControlTimer invalidate];
        
        self.nstimerControlTimer = [self startTimer];
    }
    else if (
        self.gameState == Results
        )
    {
        // Change gameState to Start_Screen
        self.gameState = Start_Screen;
        
        // Change background to darker blue
        self.view.backgroundColor = [self colorWithHexString:@"456A92"];
        
        self.uilabelTitle.text = @"Toca para Jugar";
        self.uilabelBody.text = @"Toca la pantalla lo más rápido que puedas cuando cambie el color de rojo a verde.";
        self.uiimageviewIcon.image = [UIImage imageNamed:@"touch-100"];
        
        [self resetGameValues];
        [self updateGameValues];
        
        self.uilabelAverage.text = self.strAverageReactionTime;
        self.uilabelNumberOfTries.text = self.strNumberOfTriesTaken;
    }
    else if (
        self.gameState == Partial_Results
        )
    {
        // Changes gameState to Wait
        self.gameState = Wait;
        
        // Change background to bloody red
        self.view.backgroundColor = [self colorWithHexString:@"A20900"];
        
        self.uilabelTitle.text = @"Espera al verde...";
        self.uilabelBody.text = @"";
        self.uiimageviewIcon.image = [UIImage imageNamed:@"wait-100"];
        
        // Starts game control timer
        self.nstimerControlTimer = [self startTimer];
    }
    else
    {
        // Does nothing
    }
    /*END-CASE*/
}

- (void)resetGameValues
{
    [self.nsmutablearrayReactionTimes removeAllObjects];
    self.doubleReactionTime = 0;
    self.nsintNumberOfTriesTaken = 0;
    self.uibuttonSave.enabled = NO;
    self.uibuttonSave.hidden = YES;
}

- (void)updateGameValues
{
    if (
        (self.gameState == Results) ||
        (self.gameState == Partial_Results)
        )
    {
        self.doubleReactionTime = [self.timerGameTimer timeElapsedInMilliseconds];
        
        NSLog(@"Reaction Time: %f", self.doubleReactionTime);
        
        NSNumber *nsnumReactionTime = [NSNumber numberWithDouble:self.doubleReactionTime];
        [self.nsmutablearrayReactionTimes addObject:nsnumReactionTime];
    }
    
    self.doubleAverageReactionTime = [self getAverageReactionTime];
    
    NSLog(@"Average Reaction Time: %f", self.doubleAverageReactionTime);
    
    self.strReactionTime = [[NSString alloc] initWithFormat:@"%0.2f", self.doubleReactionTime];
    self.strReactionTime = [self.strReactionTime stringByAppendingString:@" ms"];
    
    self.strAverageReactionTime = [[NSString alloc] initWithFormat:@"%0.2f", self.doubleAverageReactionTime];
    self.strAverageReactionTime = [self.strAverageReactionTime stringByAppendingString:@" ms"];
    
    self.strNumberOfTriesTaken = [[NSString alloc] initWithFormat:@"%li", self.nsintNumberOfTriesTaken];
    self.strNumberOfTriesTaken = [self.strNumberOfTriesTaken stringByAppendingString:@" de 5"];
}

- (double)getAverageReactionTime
{
    self.doubleAverageReactionTime = 0.0;
    
    if (
        self.gameState != Start_Screen
        )
    {
        for (int intReactionTime = 0; intReactionTime < self.nsmutablearrayReactionTimes.count; intReactionTime++)
        {
            double doubleReactionTime = [self.nsmutablearrayReactionTimes[intReactionTime] doubleValue];
            self.doubleAverageReactionTime = self.doubleAverageReactionTime + doubleReactionTime;
        }
        
        self.doubleAverageReactionTime = self.doubleAverageReactionTime / self.nsmutablearrayReactionTimes.count;
    }
    else
    {
        // Does nothing
    }
    
    return self.doubleAverageReactionTime;
}

- (NSTimer *)startTimer
{
    double doubleTimeInterval = arc4random() / ((pow(2, 32)-1)) * M_PI*2;
    return [NSTimer scheduledTimerWithTimeInterval:doubleTimeInterval
             target:self
             selector:@selector(timerEndedWithTimer:)
             userInfo:nil
             repeats:NO];
}

// Method that is triggered when a control timer ends
- (void)timerEndedWithTimer:(NSTimer *)timer
{
    if (
        self.gameState == Wait
        )
    {
        // Changes gameState to Tap
        self.gameState = Tap;
        
        // Change background to dark green
        self.view.backgroundColor = [self colorWithHexString:@"3FB26C"];
        
        self.uilabelTitle.text = @"¡Toca!";
        self.uilabelBody.text = @"";
        self.uiimageviewIcon.image = [UIImage imageNamed:@"tap-100"];
        
        // Starts reaction timer
        [self.timerGameTimer startTimer];
    }
    // User tapped too soon
    else
    {
        // Does nothing
    }
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

- (void)showInfoPopUp
{
    [self.popUpHelp showHelpSleepInView:self.view animated:YES];
    [self.popUpHelp showHelpSleepInView:self.view animated:YES]; // Temporary popup fix issue
    self.uitapgesturerecognizerUserTap.enabled = NO;
    [self.popUpHelp assignTappingDelegate:self];
}

- (void)enableTapping
{
    self.uitapgesturerecognizerUserTap.enabled = YES;
}

- (IBAction)saveReactionTime:(id)sender
{
}
@end
