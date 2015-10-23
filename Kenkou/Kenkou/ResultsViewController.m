//
//  ResultsViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 10/22/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:@"Resultados"];
    
    // Populate a utility dictionary.
    // Data represents the ranking of a person's health.
    NSDictionary *valueDictionary = @{@"Alimento": @"3",
                                      @"Sueño": @"7",
                                      @"Ejercicio" : @"2",
                                      @"Alcohol": @"9"};
    
    // Initiate the spiderView with its frame and values.
    _spiderView = [[BTSpiderPlotterView alloc] initWithFrame:self.view.frame valueDictionary:valueDictionary];
    
    // Set a maximum value for plotting.
    [_spiderView setMaxValue:10];
    
    self.spiderView.plotColor = [UIColor colorWithRed:1.0f green:0.44313725f blue:0.37647059f alpha:0.7];
    [self.view addSubview:_spiderView];
    
    //here on is flavoring - non essentials
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tap];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setText:@"Tap anywhere"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor grayColor]];
    [self.view addSubview:label];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(label)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(label)]];
}

- (void)tapped:(UITapGestureRecognizer *)sender
{
    NSDictionary *valueDictionary = @{@"Alimento": @(arc4random_uniform(9)+1).stringValue,
                                      @"Sueño": @(arc4random_uniform(9)+1).stringValue,
                                      @"Ejercicio" : @(arc4random_uniform(9)+1).stringValue,
                                      @"Alcohol": @(arc4random_uniform(9)+1).stringValue};
    
    NSLog(@"%@",valueDictionary);
    
    [_spiderView animateWithDuration:.3 valueDictionary:valueDictionary];
    
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

@end
