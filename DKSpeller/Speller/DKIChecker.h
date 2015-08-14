//
//  DKIChecker.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DKCheckResult;

/**
 DKIChecker declares an interface for a checker object that checks spelling of a text and returns a result.
 Since checker is used by a higher-level component (speller), we apply IoC here and let a higher-level component
 to define an interface for a lower-level component it uses.
 */
@protocol DKIChecker <NSObject>

@required
- (void)checkText:(NSString *)text inLanguages:(NSArray *)languages callback:(void (^)(DKCheckResult *result))callback;

@end
