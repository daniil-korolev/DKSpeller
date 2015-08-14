//
//  DKOnlineChecker.m
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <AFNetworking.h>

#import "DKOnlineChecker.h"
#import "DKCheckResult.h"
#import "DKMisspelling.h"

@interface DKOnlineChecker()

@property (nonatomic, readonly) AFHTTPRequestOperationManager *manager;

@end


@implementation DKOnlineChecker
@synthesize baseURL = _baseURL;

-(instancetype)initWithBaseURL:(NSURL *)baseURL
{
    NSParameterAssert(baseURL);
    
    self = [super init];
    
    if (self) {
        _baseURL = baseURL;
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:_baseURL];
    }
    return self;
}

    
- (void)checkText:(NSString *)text inLanguages:(NSArray *)languages callback:(void (^)(DKCheckResult *))callback
{
    NSParameterAssert(languages);
    NSParameterAssert(text);
    NSParameterAssert(callback);
        
    NSString *languagesString = [languages componentsJoinedByString:@","];

    [_manager GET:@"checkText"
       parameters:@{ @"text": text, @"lang": languagesString}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              callback([DKCheckResult checkResultWithText:text attributes:responseObject]);
            }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  callback(nil);
    }];
}

@end
