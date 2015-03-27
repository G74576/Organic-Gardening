//
//  TipsInfo.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipsInfo : NSObject{

    NSString *tipsName;

}

-(id)initWithTitle:(NSString *)tName;

@property(strong, nonatomic)NSString *tipsName;

@end
