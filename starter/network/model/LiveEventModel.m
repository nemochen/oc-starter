//
//  LiveEventModel.m
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "LiveEventModel.h"
#import "EventModel.h"

@implementation LiveEventModel

- (Class)modelClassWithArrayProperty: (NSString*)propertyName {
    if ([@"events" isEqualToString:propertyName]) {
        return [EventModel class];
    }
    
    return nil;
}

@end
