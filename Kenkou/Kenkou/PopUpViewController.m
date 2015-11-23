//
//  PopUpViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/16/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "PopUpViewController.h"

@interface PopUpViewController ()

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.uitextfieldName.layer.borderColor=[[UIColor orangeColor]CGColor];
    self.uitextfieldVolume.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.uitextfieldAcoholPercentage.layer.borderColor = [[UIColor orangeColor] CGColor];
    
    // Hide views all views (Unhide the one you wish to see)
    self.uiviewPopUpView.hidden = YES;
    self.uiviewPopUpViewHelpFood.hidden = YES;
    self.uiviewPopUpViewHelpSleep.hidden = YES;
    self.uiviewPopUpViewHelpAlcohol.hidden = YES;
    self.uiviewPopUpViewAlcoholAddAlcoholicDrink.hidden = YES;
    self.uiviewPopUpViewUnderDevelopment.hidden = YES;
    
    // Make it look like the screen is darkened
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
    
    // Make the popUpView pretty
    self.uibuttonClosePopUp.layer.cornerRadius = 15.0f;
    self.uiviewPopUpView.layer.cornerRadius = 5.0f;
    self.uiviewPopUpView.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    // Make the PopUpViewHelpFood pretty
    self.uibuttonClosePopUpHelpFood.layer.cornerRadius = 15.0f;
    self.uiviewPopUpViewHelpFood.layer.cornerRadius = 5.0f;
    self.uiviewPopUpViewHelpFood.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpViewHelpFood.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    // Make the PopUpViewHelpSleep pretty
    self.uibuttonClosePopUpHelpSleep.layer.cornerRadius = 15.0f;
    self.uiviewPopUpViewHelpSleep.layer.cornerRadius = 5.0f;
    self.uiviewPopUpViewHelpSleep.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpViewHelpSleep.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    // Make the PopUpViewHelpAlcohol pretty
    self.uibuttonClosePopUpHelpAlcohol.layer.cornerRadius = 15.0f;
    self.uiviewPopUpViewHelpAlcohol.layer.cornerRadius = 5.0f;
    self.uiviewPopUpViewHelpAlcohol.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpViewHelpAlcohol.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    // Make the PopUpViewAlcoholAddBeverage pretty
    self.uibuttonClosePopUpAlcoholAddAlcoholicDrink.layer.cornerRadius = 15.0f;
    self.uibuttonSaveAlcoholicDrinkAndClosePopUp.layer.cornerRadius = 15.0f;
    self.uiviewPopUpViewAlcoholAddAlcoholicDrink.layer.cornerRadius = 5.0f;
    self.uiviewPopUpViewAlcoholAddAlcoholicDrink.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpViewAlcoholAddAlcoholicDrink.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
    // Make the PopUpViewUnderDevelopment pretty
    self.uibuttonClosePopUpUnderDevelopment.layer.cornerRadius = 15.0f;
    self.uiviewPopUpViewUnderDevelopment.layer.cornerRadius = 5.0f;
    self.uiviewPopUpViewUnderDevelopment.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpViewUnderDevelopment.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);

    
    self.cgrectViewFrame = self.view.frame;
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

- (void)showAnimated
{
    self.view.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    self.view.alpha = 0.0f;
    [UIView animateWithDuration:.25f animations:^{
        self.view.alpha = 1.0f;
        self.view.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }];
}

- (void)removeAnimated
{
    [UIView animateWithDuration:.25f animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
        self.view.alpha = 0.0f;
    } completion:^(BOOL boolIsFinished) {
        if (
            boolIsFinished
            )
        {
            [self.view removeFromSuperview];
        }
    }];
}

- (void)showInView:(UIView *)View image:(UIImage *)image title:(NSString *)title message:(NSString *)message animated:(BOOL)animated
{
    [View addSubview:self.view];
    self.uiviewPopUpView.hidden = NO;
    
    self.uiimageviewTopImage.image = image;
    self.uilabelTitle.text = title;
    self.uilabelBody.text = message;
    if (
        animated
        )
    {
        [self showAnimated];
    }
}

- (void)showHelpFoodInView:(UIView *)View animated:(BOOL)animated
{
    [View addSubview:self.view];
    self.uiviewPopUpViewHelpFood.hidden = NO;
    
    if (
        animated
        )
    {
        [self showAnimated];
    }
}

- (void)showHelpSleepInView:(UIView *)View animated:(BOOL)animated
{
    [self.view setFrame:self.cgrectViewFrame];
    [self placePopUpInY:114.0f];
    [View addSubview:self.view];
    self.uiviewPopUpViewHelpSleep.hidden = NO;
    
    if (
        animated
        )
    {
        [self showAnimated];
    }
}

- (void)showHelpAlcoholInView:(UIView *)View animated:(BOOL)animated
{
    [self.view setFrame:self.cgrectViewFrame];
    [self placePopUpInY:114.0f];
    [View addSubview:self.view];
    self.uiviewPopUpViewHelpAlcohol.hidden = NO;
    
    if (
        animated
        )
    {
        [self showAnimated];
    }
}

- (void)showAlcoholAddAlcoholicDrink:(UIView *)View animated:(BOOL)animated
{
    [self.view setFrame:self.cgrectViewFrame];
    [self placePopUpInY:114.0f];
    [View addSubview:self.view];
    self.uiviewPopUpViewAlcoholAddAlcoholicDrink.hidden = NO;
    
    // Clear interface
    self.uitextfieldName.text = @"";
    self.uitextfieldVolume.text = @"";
    self.uitextfieldAcoholPercentage.text = @"";
    
    if (
        animated
        )
    {
        [self showAnimated];
    }
}

- (void)showUnderDevelopmentInView:(UIView *)View animated:(BOOL)animated
{
    [View addSubview:self.view];
    self.uiviewPopUpViewUnderDevelopment.hidden = NO;
    
    if (
        animated
        )
    {
        [self showAnimated];
    }
}

- (void)assignScrollingDelegate:(id)delegate
{
    self.scrollingDelegate = delegate;
}

- (void)assignTappingDelegate:(id)delegate
{
    self.tappingDelegate = delegate;
}

- (void)assignAddAlcoholicDrinkDelegate:(id)delegate
{
    self.addAlcoholicDrinkDelegate = delegate;
}

- (IBAction)closePopUpView:(UIButton *)sender
{
    self.uiviewPopUpView.hidden = YES;
    self.uiviewPopUpViewHelpFood.hidden = YES;
    self.uiviewPopUpViewHelpSleep.hidden = YES;
    self.uiviewPopUpViewHelpAlcohol.hidden = YES;
    self.uiviewPopUpViewAlcoholAddAlcoholicDrink.hidden = YES;
    self.uiviewPopUpViewUnderDevelopment.hidden = YES;
    
    [self removeAnimated];
    
    if (
        sender == self.uibuttonClosePopUp
        )
    {
        [self.scrollingDelegate enableScrolling];
    }
    else if (
        sender == self.uibuttonClosePopUpHelpFood
        )
    {
        [self.scrollingDelegate enableScrolling];
    }
    else if (
        sender == self.uibuttonClosePopUpHelpSleep
        )
    {
        [self.tappingDelegate enableTapping];
    }
    else if (
        sender == self.uibuttonClosePopUpHelpAlcohol
        )
    {
        [self.scrollingDelegate enableScrolling];
    }
    else if (
        sender == self.uibuttonClosePopUpAlcoholAddAlcoholicDrink
        )
    {
        self.uitextfieldName.layer.borderWidth = 0;
        self.uitextfieldVolume.layer.borderWidth = 0;
        self.uitextfieldAcoholPercentage.layer.borderWidth = 0;
        [self.scrollingDelegate enableScrolling];
    } else if (
        sender == self.uibuttonClosePopUpUnderDevelopment
        )
    {
        self.uitextfieldName.layer.borderWidth = 0;
        self.uitextfieldVolume.layer.borderWidth = 0;
        self.uitextfieldAcoholPercentage.layer.borderWidth = 0;
        [self.scrollingDelegate enableScrolling];
    }
}

- (IBAction)saveAlcoholicDrinkAndClosePopUp:(id)sender
{
    // Return text field borders    to their original color before checking them again
    self.uitextfieldName.layer.borderWidth = 0;
    self.uitextfieldVolume.layer.borderWidth = 0;
    self.uitextfieldAcoholPercentage.layer.borderWidth = 0;
    
    if (
        ![self.uitextfieldName.text isEqualToString:@""]
        && ![self.uitextfieldVolume.text isEqualToString:@""]
        && ![self.uitextfieldAcoholPercentage.text isEqualToString:@""]
        )
    {
        // Deliver textFieldValues to delegate
        NSString *strName = self.uitextfieldName.text;
        double doubleAlcoholPercentage = [self.uitextfieldAcoholPercentage.text doubleValue];
        double doubleVolume = [self.uitextfieldVolume.text doubleValue];
        
        [self.addAlcoholicDrinkDelegate
         addAlcoholicDrinkWithName:strName WithAlcoholPercentage:doubleAlcoholPercentage WithVolume:doubleVolume];
    
        [self.scrollingDelegate enableScrolling];
        
        self.uiviewPopUpViewAlcoholAddAlcoholicDrink.hidden = YES;
        
        [self removeAnimated];
    }
    else    // Remind user to add values
    {
        if (
            [self.uitextfieldName.text isEqualToString:@""]
            )
        {
            self.uitextfieldName.layer.borderWidth = 1;
        }

        if (
            [self.uitextfieldVolume.text isEqualToString:@""]
            )
        {
            self.uitextfieldVolume.layer.borderWidth = 1;
        }
        
        if (
            [self.uitextfieldAcoholPercentage.text isEqualToString:@""]
            )
        {
            self.uitextfieldAcoholPercentage.layer.borderWidth = 1;
        }
    }
}

- (void)placePopUpInY:(CGFloat)yPosition
{
    CGRect cgrectPosition = [self.view frame];
    cgrectPosition.origin.y = yPosition - 50.0f;
    [self.view setFrame:cgrectPosition];
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

@end
