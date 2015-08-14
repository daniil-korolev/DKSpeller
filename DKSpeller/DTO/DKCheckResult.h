//
//  DKCheckResult.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DKMisspelling;

@interface DKCheckResult : NSObject

/**
 The text that is corrected.
 */
@property (nonatomic, readonly, copy) NSString *text;

/**
 An array with instances of DKMisspelling.
 */
@property (nonatomic, readonly, copy) NSArray *misspellings;

- (instancetype)initWithText:(NSString *)text misspellings:(NSArray *)misspellings;

+ (instancetype) checkResultWithText:(NSString *)text attributes:(NSArray*)attributes;

@end
