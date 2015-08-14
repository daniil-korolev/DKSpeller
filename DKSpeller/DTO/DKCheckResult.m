//
//  DKCheckResult.m
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import "DKCheckResult.h"
#import "DKMisspelling.h"
@implementation DKCheckResult
- (instancetype)initWithText:(NSString *)text misspellings:(NSArray *)misspellings
{
    self = [super init];
    if (self) {
        _text = text;
        _misspellings = misspellings;
    }
    
    return self;
}
+ (instancetype)checkResultWithText:(NSString *)text attributes:(NSArray*)attributes
{
    NSMutableArray *misspellings = [[NSMutableArray alloc] init];
    for (int i = 0; i < [attributes count]; i++) {
        [misspellings addObject:[DKMisspelling misspellingForItem:attributes[i]]];
    }
    DKCheckResult *checkResult = [[DKCheckResult alloc] initWithText:text misspellings:misspellings];
    return checkResult;
}

@end
