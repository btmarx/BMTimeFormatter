//
//  TimeFormatter.h
//  FormatterTest
//
//  Created by Bernd Marx on 5/13/13.
//  Copyright (c) 2013 Bernd Marx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMTimeFormatter : NSFormatter
- (NSString *)stringForObjectValue:(id)obj;

- (NSAttributedString *)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs;

- (NSString *)editingStringForObjectValue:(id)obj;

- (BOOL)getObjectValue:(out id *)obj forString:(NSString *)string errorDescription:(out NSString **)error;

- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString **)newString errorDescription:(NSString **)error;
// Compatibility method.  If a subclass overrides this and does not override the new method below, this will be called as before (the new method just calls this one by default).  The selection range will always be set to the end of the text with this method if replacement occurs.

- (BOOL)isPartialStringValid:(NSString **)partialStringPtr proposedSelectedRange:(NSRangePointer)proposedSelRangePtr originalString:(NSString *)origString originalSelectedRange:(NSRange)origSelRange errorDescription:(NSString **)error;


+ (NSString *)timeStringFromSeconds:(double)aTimeValue;
+ (double)secondsFromTimeString:(NSString *)aTimeString;

@end
