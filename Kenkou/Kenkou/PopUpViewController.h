//
//  PopUpViewController.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/16/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@protocol enableScrolling <NSObject>

- (void)enableScrolling;

@end

@protocol enableTapping <NSObject>

- (void)enableTapping;

@end

@protocol addAlcoholicDrink <NSObject>

- (void)addAlcoholicDrinkWithName:(NSString *)name WithAlcoholPercentage:(double)percentage WithVolume:(double)volume;

@end

@interface PopUpViewController : UIViewController

// Outlets
@property (weak, nonatomic) IBOutlet UIView *uiviewPopUpView;
@property (weak, nonatomic) IBOutlet UIImageView *uiimageviewTopImage;
@property (weak, nonatomic) IBOutlet UILabel *uilabelTitle;
@property (weak, nonatomic) IBOutlet UILabel *uilabelBody;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonClosePopUp;

@property (weak, nonatomic) IBOutlet UIView *uiviewPopUpViewHelpFood;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonClosePopUpHelpFood;

@property (weak, nonatomic) IBOutlet UIView *uiviewPopUpViewHelpSleep;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonClosePopUpHelpSleep;

@property (weak, nonatomic) IBOutlet UIView *uiviewPopUpViewHelpAlcohol;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonClosePopUpHelpAlcohol;

@property (weak, nonatomic) IBOutlet UIView *uiviewPopUpViewAlcoholAddAlcoholicDrink;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldName;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldVolume;
@property (weak, nonatomic) IBOutlet UITextField *uitextfieldAcoholPercentage;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonClosePopUpAlcoholAddAlcoholicDrink;
@property (weak, nonatomic) IBOutlet UIButton *uibuttonSaveAlcoholicDrinkAndClosePopUp;


// Properties
@property (nonatomic, strong) id <enableScrolling> scrollingDelegate;
@property (nonatomic, strong) id <enableTapping> tappingDelegate;
@property (nonatomic, strong) id <addAlcoholicDrink> addAlcoholicDrinkDelegate;
@property CGRect cgrectViewFrame;

// Action methods
- (IBAction)closePopUpView:(UIButton *)sender;
- (IBAction)saveAlcoholicDrinkAndClosePopUp:(id)sender;
- (void)showInView:(UIView *)View image:(UIImage *)image title:(NSString *)title message:(NSString *)message animated:(BOOL)animated;
- (void)showHelpFoodInView:(UIView *)View animated:(BOOL)animated;
- (void)showHelpSleepInView:(UIView *)View animated:(BOOL)animated;
- (void)showHelpAlcoholInView:(UIView *)View animated:(BOOL)animated;
- (void)showAlcoholAddAlcoholicDrink:(UIView *)View animated:(BOOL)animated;
- (void)assignScrollingDelegate:(id)delegate;
- (void)assignTappingDelegate:(id)delegate;
- (void)assignAddAlcoholicDrinkDelegate:(id)delegate;
- (void)placePopUpInY:(CGFloat)yPosition;

@end
