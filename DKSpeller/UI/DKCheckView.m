//
//  DKCheckView.m
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import "DKCheckView.h"

@interface DKCheckView () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;

@end


@implementation DKCheckView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textView.frame = self.bounds; // Make text view the same size as self
}

// Created lazily at the first call to -layoutSubviews
- (UITextView *)textView
{
    if (_textView == nil) {
        _textView = [[UITextView alloc] initWithFrame:CGRectZero];
        [_textView setAutocorrectionType:UITextAutocorrectionTypeNo];
        _textView.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:25];
        _textView.delegate = self;
        [self addSubview:_textView];
    }
    return _textView;
}

- (void)setText:(NSString *)text
{
    _textView.text = text;
}

- (NSString *)text
{
    return _textView.text;
}

#pragma mark - Public

- (void)reloadData
{
    [self clearAttributes];

    if ([self dataSourceHasCorrections] == NO) {
        return;
    }

    NSArray *ranges = [self rangesOfCorrections];
    self.textView.attributedText = [self attributedTextWithHighlightedRanges:ranges];
}

#pragma mark - Helpers

- (NSAttributedString *)attributedTextWithHighlightedRanges:(NSArray *)ranges
{
    NSMutableAttributedString *ret = [self.textView.attributedText mutableCopy];

    for (NSValue *wrapper in ranges) {
        NSRange range = [wrapper rangeValue];
        NSDictionary *attributes = [self misspelledTextAttributes];
        [ret addAttributes:attributes range:range];
    }

    return [ret copy]; // ensure immutable object is returned
}

- (NSDictionary *)misspelledTextAttributes
{
    return @{ NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternDot) };
}

- (void)clearAttributes
{
    NSMutableAttributedString *string = [self.textView.attributedText mutableCopy];

    NSArray *attributesToClean = [self.misspelledTextAttributes allKeys];
    for (NSString *attribute in attributesToClean) {
        [string removeAttribute:attribute range:NSMakeRange(0, string.length)];
    }

    self.textView.attributedText = string;
}

#pragma mark - Data Source Communication

- (BOOL)dataSourceHasCorrections
{
    return [self.dataSource hasCorrections:self.text];
}

- (NSArray *)rangesOfCorrections
{
    return [self.dataSource correctionRanges];
}

- (NSArray *)variantsForRange:(NSRange)range
{
    return [self.dataSource variantsForRange:range];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    [self.delegate checkView:self didChangeText:textView.text];
}

@end
