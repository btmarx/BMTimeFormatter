//
//  TimeFormatter.m
//  FormatterTest
//
//  Created by Bernd Marx on 5/13/13.
//  Copyright (c) 2013 Bernd Marx. All rights reserved.
//

#import "BMTimeFormatter.h"

@implementation BMTimeFormatter

- (NSString *)stringForObjectValue:(id)obj
{
    //NSLog(@"stringForObjectValue %f", (double)[obj doubleValue]);
    
    double aTimeValue = [obj doubleValue];
    return( [BMTimeFormatter timeStringFromSeconds:aTimeValue] );
}


- (NSAttributedString *)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs
{
    //NSLog(@"attributedStringForObjectValue %f", (double)[obj doubleValue]);
    return nil;
}


- (NSString *)editingStringForObjectValue:(id)obj
{
    double aTimeValue = [obj doubleValue];
    return( [BMTimeFormatter timeStringFromSeconds:aTimeValue] );
}


- (BOOL)getObjectValue:(out id *)obj forString:(NSString *)string errorDescription:(out NSString **)error
{
    //NSLog(@"getObjectValue");
    //NSLog(@"getObjectValue %@", string);
    
    double value = [BMTimeFormatter secondsFromTimeString:string];
    
    *obj = @(value);
    return TRUE;
}



- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString **)newString errorDescription:(NSString **)error
{
    return TRUE;
}
// Compatibility method.  If a subclass overrides this and does not override the new method below, this will be called as before (the new method just calls this one by default).  The selection range will always be set to the end of the text with this method if replacement occurs.

- (BOOL)isPartialStringValid:(NSString **)partialStringPtr proposedSelectedRange:(NSRangePointer)proposedSelRangePtr originalString:(NSString *)origString originalSelectedRange:(NSRange)origSelRange errorDescription:(NSString **)error
{
    return TRUE;
}


+ (NSString *)timeStringFromSeconds:(double)aTimeValue
{
    double frac = 0;
    BOOL isNegative = NO;
    if ( aTimeValue < 0)
    {
        isNegative = YES;
        aTimeValue = abs(aTimeValue);
    }
    int milliseconds = (int)(modf(aTimeValue, &frac) * 1000);
    int isec = (int)frac;
    int hours = isec / 3600;
    int minutes = (isec % 3600) / 60;
    int seconds = isec % 60;
    
    NSString *str = @"";
    
    if ( isNegative == YES )
    {
        str = [NSString stringWithFormat:@"-%02d:%02d:%02d.%03d",hours,minutes,seconds,milliseconds];
    }
    else
    {
        str = [NSString stringWithFormat:@" %02d:%02d:%02d.%03d",hours,minutes,seconds,milliseconds];
    }
    return str;
}


+ (double)secondsFromTimeString:(NSString *)aTimeString
{
    int hours    = 0;
    int minutes  = 0;
    int seconds  = 0;
    int millis   = 0;
    double value = [aTimeString doubleValue];
    
    if ( [aTimeString length] == 12 )
    {
        hours   = [[aTimeString substringWithRange:NSMakeRange(0, 2)] intValue];
        minutes = [[aTimeString substringWithRange:NSMakeRange(3, 2)] intValue];
        seconds = [[aTimeString substringWithRange:NSMakeRange(6, 2)] intValue];
        millis  = [[aTimeString substringWithRange:NSMakeRange(9, 3)] intValue];
        value = hours*60*60+minutes*60+seconds+(double)millis/1000;
    }
    return value;
}


@end
