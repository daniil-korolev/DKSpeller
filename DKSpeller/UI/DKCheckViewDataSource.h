//
//  DKCheckViewDataSource.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DKCheckViewDataSource <NSObject>

/**
 Tells the check view that a data source has corrections for a given text.

 @param text The text in question.
 
 @return A Boolean value indicating that there are some corrections for text.
 */
- (BOOL)hasCorrections:(NSString *)text;

/**
 Tells the check view what ranges of text are misspelled.

 @return An NSArray of NSValues that store NSRanges for which a misspelling was detected.
 */
- (NSArray *)correctionRanges;

/**
 Tells the check view that there are some correction variants for a given range.

 @param range A range for which corrections should be fetched.

 @return An NSArray of NSStrings of correction variants.
 */
- (NSArray *)variantsForRange:(NSRange)range;


@end
