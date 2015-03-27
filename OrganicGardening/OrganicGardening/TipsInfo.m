//
//  TipsInfo.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "TipsInfo.h"

@implementation TipsInfo
@synthesize tipsName;

-(id)initWithTitle:(NSString *)tName{
    if ((self = [super init])) {
        tipsName = tName;
    }
    return self;
}

@end
