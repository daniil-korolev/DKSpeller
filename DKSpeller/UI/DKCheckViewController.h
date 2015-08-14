//
//  DKCheckViewController.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKSpeller;

@interface DKCheckViewController : UIViewController

/**
 An instance of DKSpeller. 
 Injected by property (here we use non-initializer injection is better because
 it sucks to create new initializers for UIViewController.)
 */
@property (nonatomic, strong) DKSpeller *speller;

@end
