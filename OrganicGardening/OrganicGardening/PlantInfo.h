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

}

-(id)initWithTitle:(NSString *)pName;

@property(strong, nonatomic)NSString *plantName;

@end
