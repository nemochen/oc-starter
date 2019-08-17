//
//  NSDictionary+Model.m
//  starter
//
//  Created by nemochen on 2019/8/15.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "NSDictionary+Model.h"
#import "ClassUtils.h"

@implementation NSDictionary (Model)

/**
 * 将 dic 转换为 model
 */
- (id)toModel:(Class)modelClass {
    id model = [[modelClass alloc] init];
    
    if (self.count > 0) {
        NSEnumerator * keyEnumerator = [self keyEnumerator];
        for (id key in keyEnumerator) {
            NSString * propertyName = key;
            id propertyValue = [self valueForKey:propertyName];
            
            if (propertyValue == nil || propertyValue == [NSNull null]) {
                continue;
            }
            
            if ([propertyValue isKindOfClass:[NSDictionary class]]) {
                Class typeClass = [ClassUtils propertyClassNameWithClass:modelClass propertyName:propertyName];
                propertyValue = [propertyValue toModel:typeClass]; // 转换为model
            }
            if ([propertyValue isKindOfClass:[NSArray class]]) {
                NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[propertyValue count]];
                
                if ([model respondsToSelector:@selector(modelClassWithArrayProperty:)]) {
                    Class objClass = [model performSelector:@selector(modelClassWithArrayProperty:) withObject:propertyName];
                    
                    if (objClass != Nil) {
                        for (NSDictionary *dict in propertyValue) {
                            [array addObject:[dict toModel:objClass]];
                        }
                    }
                }
                
                propertyValue = array;
            }
            
            // 设置变量
            NSString * propertySetMethod = [NSString stringWithFormat:@"set%@%@:", [[propertyName substringToIndex:1] capitalizedString], [propertyName substringFromIndex:1]];
            SEL selector = NSSelectorFromString(propertySetMethod);
            if ([model respondsToSelector:selector]) {
                [model setValue:propertyValue forKey:propertyName];
            }
        }
    }
    
    return model;
}

@end
















