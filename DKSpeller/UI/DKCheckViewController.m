//
//  DKCheckViewController.m
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import "DKCheckViewController.h"

#import "DKSpeller.h"
#import "DKCheckResult.h"
#import "DKMisspelling.h"

#import "DKCheckView.h"

@interface DKCheckViewController ()<DKCheckViewDataSource, DKCheckViewDelegate>

@property (nonatomic, readonly) DKCheckView *checkView;

@end


@implementation DKCheckViewController

@dynamic checkView; // Custom getter

- (void)loadView
{
    DKCheckView *checkView = [[DKCheckView alloc] initWithFrame:CGRectZero];
    checkView.dataSource = self;
    checkView.delegate = self;

    self.view = checkView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"checkmark"]];
    [self.navigationItem setTitleView:titleView];
    [self.checkView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DKCheckView *)checkView
{
    return (DKCheckView *)self.view;
}

#pragma mark - Business Logic

- (void)synchronize
{
    [self.speller synchronizeWithCompletion:^(DKCheckResult *completion, NSError *error) {
        [self handleSyncronization:completion error:error];
    }];
}

- (void)handleSyncronization:(DKCheckResult *)result error:(NSError *)error
{
    [self.checkView reloadData];
}

#pragma mark - DKCheckViewDataSource

- (BOOL)hasCorrections:(NSString *)text
{
    return [self.speller.text isEqualToString:text] && self.speller.result.misspellings.count;
}

- (NSArray *)correctionRanges
{
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:self.speller.result.misspellings.count];

    for (DKMisspelling *misspelling in self.speller.result.misspellings) {
        NSValue *value = [NSValue valueWithRange:misspelling.range];
        [ret addObject:value];
    }

    return [ret copy];
}

- (NSArray *)variantsForRange:(NSRange)range
{
    return nil;
}

#pragma mark - DKCheckViewDelegate

- (void)checkView:(DKCheckView *)view didChangeText:(NSString *)newText
{
    self.speller.text = newText;
    [self synchronize];
}

@end
