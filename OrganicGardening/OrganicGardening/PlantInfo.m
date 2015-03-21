//
//  PlantInfo.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantInfo.h"

@implementation PlantInfo
@synthesize plantName;

-(id)initWithTitle:(NSString *)pName{
    if ((self = [super init])) {
        plantName = pName;
    }
    return self;
}

@end
