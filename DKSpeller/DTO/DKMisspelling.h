//
//  DKMisspelling.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 DKMisspelling stores a range in text of its parent object, DKCheckResult, that is erroneous. 
 */
@interface DKMisspelling : NSObject

/**
 The range of erroneously spelled word.
 */
@property (nonatomic, readonly, assign) NSRange range;

/**
 The variants of corrections for the word contained in range.
 */
@property (nonatomic, readonly, copy) NSArray *variants;

- (instancetype)initWithRange:(NSRange)range variants:(NSArray *)variants;

+ (instancetype)misspellingForItem: (NSDictionary *) item;

@end
