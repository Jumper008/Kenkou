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
    // Do any additional setup after loading the view from its nib.
    
    self.uibuttonClosePopUp.layer.cornerRadius = 15.0f;
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
    self.uiviewPopUpView.layer.cornerRadius = 5.0f;
    self.uiviewPopUpView.layer.shadowOpacity = 0.8f;
    self.uiviewPopUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
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

- (void)assignDelegate:(id)delegate
{
    self.delegate = delegate;
}

- (IBAction)closePopUpView:(id)sender
{
    [self removeAnimated];
    [self.delegate enableScrolling];
}

- (void)placePopUpInY:(CGFloat)yPosition
{
    CGRect cgrectPosition = [self.view frame];
    cgrectPosition.origin.y = yPosition - 50.0f;
    [self.view setFrame:cgrectPosition];
}
@end
