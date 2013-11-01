//
//  AppDelegate.m
//  BMTimeFormatterDemo
//
//  Created by Bernd Marx on 01/11/13.
//  Copyright (c) 2013 BM Productions. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize timeValue;
@synthesize durationValue;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setDurationValue:100.0];
    [[self timeSlider] setMaxValue:durationValue];
    [[self durationLabel] setDoubleValue:durationValue];
    [self updateLabels];
}

-(void) updateLabels
{
    [[self timeField] setDoubleValue:timeValue];
    [[self remainingTimeField] setDoubleValue:durationValue - timeValue];
}


- (IBAction)setTime:(id)sender
{
    [self setTimeValue:[sender doubleValue]];
    if ( sender == [self timeSlider])
    {
        [self updateLabels];
    }
    else
    {
        [[self remainingTimeField] setDoubleValue:durationValue - timeValue];
        [[self timeSlider] setDoubleValue:timeValue];
    }
}



@end
