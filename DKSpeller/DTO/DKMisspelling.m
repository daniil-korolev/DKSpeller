//
//  DKMisspelling.m
//  DKSpeller
//
//  Created by Daniil Korolev on 31.05.14.
//  Copyright (c) 2014 Daniil Korolev. All rights reserved.
//

#import "DKMisspelling.h"

@implementation DKMisspelling

- (instancetype)initWithRange:(NSRange)range variants:(NSArray *)variants
{    
    self = [super init];
    if (self) {
        _range = range;
        _variants = variants;
    }
    return self;
}

+ (instancetype)misspellingForItem: (NSDictionary *) item
{
    NSRange range = NSMakeRange([item[@"pos"] unsignedIntegerValue], [item[@"len"] unsignedIntegerValue]);
    NSArray *variants = item[@"s"];
    return [[DKMisspelling alloc] initWithRange:range variants:variants];
}
@end
