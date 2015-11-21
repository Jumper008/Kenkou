//
//  Timer.h
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject

// Properties
@property (nonatomic, strong) NSDate *nsdateStart;
@property (nonatomic, strong) NSDate *nsdateEnd;

// Action methods
- (void) startTimer;
- (void) stopTimer;
- (double) timeElapsedInSeconds;
- (double) timeElapsedInMilliseconds;
- (double) timeElapsedInMinutes;
- (id) initTimer;

@end
