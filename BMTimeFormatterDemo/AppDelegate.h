//
//  AppDelegate.h
//  BMTimeFormatterDemo
//
//  Created by Bernd Marx on 01/11/13.
//  Copyright (c) 2013 BM Productions. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property double timeValue;
@property double durationValue;

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *timeField;
@property (weak) IBOutlet NSTextField *remainingTimeField;
@property (weak) IBOutlet NSSlider *timeSlider;
@property (weak) IBOutlet NSTextField *durationLabel;


- (IBAction)setTime:(id)sender;


@end
