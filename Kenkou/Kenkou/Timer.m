//
//  Timer.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "Timer.h"

@implementation Timer

- (id) initTimer
{
    self = [super init];
    
    if (
        self
        )
    {
        _nsdateStart = nil;
        _nsdateEnd = nil;
    }
    
    return self;
}

- (void) startTimer {
    self.nsdateStart = [NSDate date];
}

- (void) stopTimer {
    self.nsdateEnd = [NSDate date];
}

- (double) timeElapsedInSeconds {
    return [self.nsdateEnd timeIntervalSinceDate:self.nsdateStart];
}

- (double) timeElapsedInMilliseconds {
    return [self timeElapsedInSeconds] * 1000.0f;
}

- (double) timeElapsedInMinutes {
    return [self timeElapsedInSeconds] / 60.0f;
}


@end
