//
//  DKCheckView.h
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DKCheckViewDataSource.h"
#import "DKCheckViewDelegate.h"

@interface DKCheckView : UIView

/**
 The text, entered by user. It can be different from checked text.
 */
@property (nonatomic, readonly, strong) NSString *text;

/**
 The data source providing data on corrections. 
 Note the `weak` attribute – the view only holds a reference to dataSource
 and doesn't own it. Otherwise a retain cycle will occur.
 */
@property (nonatomic, weak) id<DKCheckViewDataSource> dataSource;

@property (nonatomic, weak) id<DKCheckViewDelegate> delegate;

- (void)reloadData;

@end
