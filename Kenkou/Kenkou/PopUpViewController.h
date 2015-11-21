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


// Properties
@property (nonatomic, strong) id <enableScrolling> delegate;

// Action methods
- (IBAction)closePopUpView:(id)sender;
- (void)showInView:(UIView *)View image:(UIImage *)image title:(NSString *)title message:(NSString *)message animated:(BOOL)animated;
- (void)showHelpFoodInView:(UIView *)View animated:(BOOL)animated;
- (void)showHelpSleepInView:(UIView *)View animated:(BOOL)animated;
- (void)assignDelegate:(id)delegate;
- (void)placePopUpInY:(CGFloat)yPosition;

@end
