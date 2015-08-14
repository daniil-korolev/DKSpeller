//
//  DKSpeller.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DKIChecker.h"

@interface DKSpeller : NSObject

/**
 A checker that serves as a data source for speller.
 It can be any object that adopts a DKIChecker interface (EVEN a test mock ;).
 */
@property (nonatomic, readonly, strong) id<DKIChecker> checker;

/**
 The text which should be checked.
 */
@property (nonatomic, copy) NSString *text;

/**
 The check result for text.
 */
@property (nonatomic, readonly, strong) DKCheckResult *result;

- (instancetype)initWithChecker:(id<DKIChecker>)checker; // <- DI in initializer, classic!

- (BOOL)isSynchronized;

- (void)synchronize;

- (void)synchronizeWithCompletion:(void (^)(DKCheckResult *completion, NSError *error))completion;

@end
