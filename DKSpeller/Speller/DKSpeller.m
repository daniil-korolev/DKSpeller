//
//  DKSpeller.m
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import "DKSpeller.h"
#import "DKCheckResult.h"
@implementation DKSpeller

-(id)initWithChecker:(id<DKIChecker>)checker
{
    self = [super init];
    if (self) {
        _checker = checker;
    }
    return self;
    
}

- (void)synchronize
{
    [self synchronizeWithCompletion:nil];
}

- (void)synchronizeWithCompletion:(void (^)(DKCheckResult *, NSError *))completion
{
    if (self.isSynchronized) {
        return;
    }
    
    [_checker checkText:_text inLanguages:@[@"en", @"ru"] callback:^(DKCheckResult *result) {
        if ([self handleResult:result]) {
            if (completion) {
                completion(_result, nil);
            }
        }
    }];
}

- (BOOL)handleResult:(DKCheckResult *)result
{
    if ([result.text isEqualToString:self.text] == NO) {
        return NO;
    }

    _result = result;
    return YES;
}

- (BOOL)isSynchronized
{
    return [self.text isEqual:self.result.text];
}

@end
