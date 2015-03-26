//
//  PlantInfo.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantInfo.h"

@implementation PlantInfo
@synthesize plantName, plantZone;

-(id)initWithTitle:(NSString *)pName pZone:(int)pZone{
    if ((self = [super init])) {
        plantName = pName;
        plantZone = pZone;
    }
    return self;
}

@end
