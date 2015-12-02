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
    
    self.uicolorRedColor = [self colorWithHexString:@"C03936"];
    self.uicolorYellowColor = [self colorWithHexString:@"FFF563"];
    self.uicolorGreenColor = [self colorWithHexString:@"4BA85C"];
    
    NSString *strTitle = self.strUsername;
    
    [self setTitle:[strTitle stringByAppendingString:@", tus resultados"]];
    
    // Populate a utility dictionary.
    // Data represents the ranking of a person's health.
    NSDictionary *valueDictionary = [self populateSpiderPlotGraphWithNumberOfRecords:4];
    
    // Initiate the spiderView with its frame and values.
    CGRect cgrectSpiderPlotFrame = self.uiviewSpiderPlotView.frame;
    cgrectSpiderPlotFrame.origin.y = 0.0;
    
    _spiderView = [[BTSpiderPlotterView alloc] initWithFrame:cgrectSpiderPlotFrame valueDictionary:valueDictionary];
    
    if (
        self.doubleGeneralScore < 33.33
        )
    {
        self.spiderView.plotColor = self.uicolorRedColor;
    }
    else if (
             self.doubleGeneralScore < 66.66
             )
    {
        self.spiderView.plotColor = self.uicolorYellowColor;
    }
    else
    {
        self.spiderView.plotColor = self.uicolorGreenColor;
    }
    
    // Set a maximum value for plotting.
    [_spiderView setMaxValue:10];
    
    [self.uiviewSpiderPlotView addSubview:_spiderView];
    
    //here on is flavoring - non essentials
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tap];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setText:@"Toca para cambiar el alcance"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor grayColor]];
    [self.view addSubview:label];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(label)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label]-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(label)]];
}

- (void)tapped:(UITapGestureRecognizer *)sender
{
    /*CASE*/
    if (
        self.uisegmentedcontrolPlotFocus.selectedSegmentIndex == 0
        )
    {
        self.uisegmentedcontrolPlotFocus.selectedSegmentIndex = 1;
        [self updateSpiderPlotWithNumberOfRecords:7];
    }
    else if (
             self.uisegmentedcontrolPlotFocus.selectedSegmentIndex == 1
             )
    {
        self.uisegmentedcontrolPlotFocus.selectedSegmentIndex = 2;
        [self updateSpiderPlotWithNumberOfRecords:14];
    }
    else if (
             self.uisegmentedcontrolPlotFocus.selectedSegmentIndex == 2
             )
    {
        self.uisegmentedcontrolPlotFocus.selectedSegmentIndex = 3;
        [self updateSpiderPlotWithNumberOfRecords:30];
    }
    else
    {
        self.uisegmentedcontrolPlotFocus.selectedSegmentIndex = 0;
        [self updateSpiderPlotWithNumberOfRecords:4];
    }
    /*END-CASE*/
    
}

- (void)updateSpiderPlotWithNumberOfRecords:(NSInteger)records
{
    NSDictionary *valueDictionary = [self populateSpiderPlotGraphWithNumberOfRecords:records];
    
    NSLog(@"%@",valueDictionary);
    
    [_spiderView animateWithDuration:.3 valueDictionary:valueDictionary];
}

- (NSDictionary *)populateSpiderPlotGraphWithNumberOfRecords:(NSInteger)records
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    NSDate *nsdateCurrentDate = [NSDate date];
    
    double doubleSecondsInADay = -86400.0;
    
    NSMutableArray *nsmutablearrayDatesRequired = [[NSMutableArray alloc] init];
    
    NSLog(@"Checking records for dates:");
    
    for (int intDate = 0; intDate < records; intDate++)
    {
        [nsmutablearrayDatesRequired addObject:[dateFormatter stringFromDate:[nsdateCurrentDate dateByAddingTimeInterval:intDate * doubleSecondsInADay]]];
        
        NSLog(@"    %@", [dateFormatter stringFromDate:[nsdateCurrentDate dateByAddingTimeInterval:intDate * doubleSecondsInADay]]);
    }
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *nsManagedObjectContext = [appDelegate managedObjectContext];
    NSEntityDescription *nsEntityDescription =
    [NSEntityDescription entityForName:@"Records" inManagedObjectContext:nsManagedObjectContext];
    
    // A request is created
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    // The entity for the request is specified
    [request setEntity: nsEntityDescription];
    
    NSError *error;
    
    // The request is executed
    NSArray *nsArrayMatchedObject = [nsManagedObjectContext executeFetchRequest: request error:&error];
    
    NSLog(@"Number of recorded dates: %li", (unsigned long)nsArrayMatchedObject.count);
    
    NSMutableArray *nsmutablearrayRecords = [[NSMutableArray alloc] init];
    
    // Getting most recent available records up to specified record number in variable "records"
    for (int intRecord = 0; intRecord < nsArrayMatchedObject.count; intRecord++)
    {
        [nsmutablearrayRecords addObject:[nsArrayMatchedObject objectAtIndex:nsArrayMatchedObject.count - 1 - intRecord]];
    }
    
    NSMutableArray *nsmutablearrayRecordsInRange = [[NSMutableArray alloc] init];
    
    NSLog(@"Found records in range for dates: ");
    
    // Getting records in specified range
    for (int intRecord = 0; intRecord < nsmutablearrayRecords.count; intRecord++)
    {
        for (int intStringDate = 0; intStringDate < nsmutablearrayDatesRequired.count; intStringDate++)
        {
            NSDate *nsdateRecordDate = [[nsmutablearrayRecords objectAtIndex:intRecord] valueForKey:@"date"];
            
            if (
                [[dateFormatter stringFromDate:nsdateRecordDate] isEqualToString:[nsmutablearrayDatesRequired objectAtIndex:intStringDate]]
                )
            {
                NSLog(@"    %@", [dateFormatter stringFromDate:nsdateRecordDate]);
                [nsmutablearrayRecordsInRange addObject:[nsmutablearrayRecords objectAtIndex:intRecord]];
            }
        }
    }
    
    NSDictionary *nsdictionarySpiderPlotValues = [self getSpiderPlotValuesFromArray:nsmutablearrayRecordsInRange WithNumberOfExpectedRecords:records];
    
    return nsdictionarySpiderPlotValues;
}
                                                  
- (NSDictionary *)getSpiderPlotValuesFromArray:(NSArray *)array WithNumberOfExpectedRecords:(NSInteger)records
{
    int intRecords = 0;
    double doubleFoodAverage = 0.0;
    double doubleExerciseAverage = 0.0;
    double doubleSleepAverage = 0.0;
    double doubleAlcoholAverage = 0.0;
    self.doubleGeneralScore = 0.0;
    
    /*WHILE-DO*/
    while (
           intRecords < array.count
           )
    {
        // Food Average calculation
        double doubleFoodAveragePerReport = 0.0;
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"fruitsAndVegetables"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"cereals"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"sugars"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"fats"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"calcium"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"salts"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"water"] integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"eatingResponsibly1"]integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"eatingResponsibly2"]integerValue];
        doubleFoodAveragePerReport = doubleFoodAveragePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"eatingResponsibly3"]integerValue];
        doubleFoodAveragePerReport = (doubleFoodAveragePerReport * 2) / 10;
        
        doubleFoodAverage = doubleFoodAverage + doubleFoodAveragePerReport;
        
        // Exercise Average calculation
        double doubleExerciseValuePerReport = [[[array objectAtIndex:intRecords] valueForKey:@"aerobicTime"] integerValue];
        doubleExerciseValuePerReport = doubleExerciseValuePerReport + [[[array objectAtIndex:intRecords] valueForKey:@"anaerobicTime"] integerValue];
        doubleExerciseValuePerReport = doubleExerciseValuePerReport * (10.0/30.0);
        
        doubleExerciseAverage = doubleExerciseAverage + doubleExerciseValuePerReport;
        
        // Sleep Average calculation
        double doubleSleepValuePerReport = [[[array objectAtIndex:intRecords] valueForKey:@"averageReactionTime"] doubleValue];
        doubleSleepValuePerReport = 10 - ((doubleSleepValuePerReport - 250.0) * (1.0/20.0));
        
        if (
            doubleSleepValuePerReport > 10.0
            )
        {
            doubleSleepValuePerReport = 10.0;
        }
        else if (
            doubleSleepValuePerReport < 0.0
            )
        {
            doubleSleepValuePerReport = 0.0;
        }
        
        doubleSleepAverage = doubleSleepAverage + doubleSleepValuePerReport;
        
        // Alcohol Avergae calculation
        double doubleRecommendedConsumptionPerDay = 0.0;
        
        if (
            self.boolIsUserFemale
            )
        {
            doubleRecommendedConsumptionPerDay = 20.0;
        }
        else
        {
            doubleRecommendedConsumptionPerDay = 30.0;
        }
        
        double doubleAlcoholValuePerReport = [[[array objectAtIndex:intRecords] valueForKey:@"alcoholGrams"] doubleValue];
        doubleAlcoholValuePerReport = 10 - ((doubleAlcoholValuePerReport - doubleRecommendedConsumptionPerDay) * (1.0/5.0));
        
        if (
            doubleAlcoholValuePerReport > 10.0
            )
        {
            doubleAlcoholValuePerReport = 10.0;
        }
        else if (
                 doubleAlcoholValuePerReport < 0.0
                 )
        {
            doubleAlcoholValuePerReport = 0.0;
        }
        
        doubleAlcoholAverage = doubleAlcoholAverage + doubleAlcoholValuePerReport;
        
        intRecords = intRecords + 1;
    }
    
    doubleFoodAverage = doubleFoodAverage / records;
    doubleExerciseAverage = doubleExerciseAverage / records;
    doubleSleepAverage = doubleSleepAverage / records;
    doubleAlcoholAverage = doubleAlcoholAverage / records;
    
    NSString *strFoodAverage = [[NSString alloc] initWithFormat:@"%f", doubleFoodAverage];
    NSString *strExerciseAverage = [[NSString alloc] initWithFormat:@"%f", doubleExerciseAverage];
    NSString *strSleepAverage = [[NSString alloc] initWithFormat:@"%f", doubleSleepAverage];
    NSString *strAlcoholAverage = [[NSString alloc] initWithFormat:@"%f", doubleAlcoholAverage];
    
    NSDictionary *nsdictionaryValueDictionary = @{@"Alimentación": strFoodAverage,
                                      @"Ejercicio": strExerciseAverage,
                                      @"Sueño" : strSleepAverage,
                                      @"Alcohol": strAlcoholAverage};
    
    self.doubleGeneralScore = self.doubleGeneralScore + doubleFoodAverage + doubleExerciseAverage + doubleSleepAverage +
    doubleAlcoholAverage;
    self.doubleGeneralScore = (self.doubleGeneralScore / 4) * 10;
    
    if (
        self.doubleGeneralScore < 33.33
        )
    {
        self.spiderView.plotColor = self.uicolorRedColor;
    }
    else if (
        self.doubleGeneralScore < 66.66
        )
    {
        self.spiderView.plotColor = self.uicolorYellowColor;
    }
    else
    {
        self.spiderView.plotColor = self.uicolorGreenColor;
    }
    
    NSString *strGeneralScore = @"Puntaje: ";
    strGeneralScore = [strGeneralScore stringByAppendingString:[[NSString alloc] initWithFormat:@"%0.2f", self.doubleGeneralScore]];
    
    self.uilabelScore.text = strGeneralScore;
    
    return nsdictionaryValueDictionary;
}

- (NSManagedObject *)getRecordInArray:(NSArray *)array
{
    NSLog(@"Retrieving record.");
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    NSDate *nsdateCurrentDate = [NSDate date];
    
    NSManagedObject *nsmanagedobjectSelectedRecord = nil;
    int intNSManagedObject = 0;
    
    /*WHILE-DO*/
    while (
           (intNSManagedObject < array.count) &&
           (nsmanagedobjectSelectedRecord == nil)
           )
    {
        NSManagedObject *nsmanagedobjectDate = array[intNSManagedObject];
        NSDate *nsdateComparisonDate = [nsmanagedobjectDate valueForKey:@"date"];
        
        if (
            [[dateFormatter stringFromDate:nsdateCurrentDate] isEqualToString:[dateFormatter stringFromDate:nsdateComparisonDate]]
            )
        {
            nsmanagedobjectSelectedRecord = nsmanagedobjectDate;
        }
        
        intNSManagedObject = intNSManagedObject + 1;
    }
    
    return nsmanagedobjectSelectedRecord;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                           alpha:0.7f];
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
