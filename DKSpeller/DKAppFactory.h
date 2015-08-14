//
//  DKAppBuilder.h
//  DKSpeller
//
//  Created by Daniil Korolev on 03.06.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon.h>
@interface DKAppFactory : TyphoonAssembly

- (UIViewController *)rootViewController;

@end
