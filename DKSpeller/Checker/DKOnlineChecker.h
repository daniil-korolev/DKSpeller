//
//  DKOnlineChecker.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DKIChecker.h"

@interface DKOnlineChecker : NSObject<DKIChecker> // <- adopts the interface (protocol)

/**
 An URL of API endpoint.
 It is injected as well, because DKOnlineChecker encapsulates only the logic of dealing with relative API methods.
 */
@property (nonatomic, readonly, strong) NSURL *baseURL;

- (instancetype)initWithBaseURL:(NSURL *)baseURL;

// No other definitions, as DKIChecker interface provides a bunch of them already.

@end
