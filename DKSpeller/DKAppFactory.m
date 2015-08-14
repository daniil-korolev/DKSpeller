//
//  DKAppBuilder.m
//  DKSpeller
//
//  Created by Daniil Korolev on 03.06.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import "DKAppFactory.h"

#import "DKOnlineChecker.h"
#import "DKSpeller.h"
#import "DKCheckViewController.h"

@implementation DKAppFactory

- (id)rootViewController
{
    return [TyphoonDefinition withClass:[UINavigationController class]
            configuration:^(TyphoonDefinition *definition) {
                [definition useInitializer:@selector(initWithRootViewController:) parameters:^(TyphoonMethod *initializer) {
                    [initializer injectParameterWith:[self defaultViewController]];
                }];
            }];
}

- (id)defaultViewController
{
    return [TyphoonDefinition withClass:[DKCheckViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(speller) with:[self defaultSpeller]];
    }];

}

- (id)defaultSpeller
{
    return [TyphoonDefinition withClass:[DKSpeller class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithChecker:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self defaultChecker]];
        }];
    }];
}

- (id<DKIChecker>)defaultChecker
{
    NSString *baseUrlString = @"http://speller.yandex.net/services/spellservice.json";
    NSURL *baseUrl = [[NSURL alloc] initWithString:baseUrlString];
    return [[DKOnlineChecker alloc] initWithBaseURL:baseUrl];
}

@end
