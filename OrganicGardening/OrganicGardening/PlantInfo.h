//
//  PlantInfo.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlantInfo : NSObject{

    NSString *plantName;
    int plantZone;
}

-(id)initWithTitle:(NSString *)pName pZone:(int)pZone;

@property(strong, nonatomic)NSString *plantName;
@property int plantZone;

@end
