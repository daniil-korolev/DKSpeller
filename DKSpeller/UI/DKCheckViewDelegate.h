//
//  DKCheckViewDelegate.h
//  DKSpeller
//
//  Created by Daniil Korolev on 03.06.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DKCheckView;

@protocol DKCheckViewDelegate <NSObject>

- (void)checkView:(DKCheckView *)view didChangeText:(NSString *)newText;

@end