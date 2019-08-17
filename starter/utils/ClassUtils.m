//
//  ClassUtils.m
//  starter
//
//  Created by nemochen on 2019/8/16.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "ClassUtils.h"
#import <objc/runtime.h>

#define kAttributeType              "T" //变量类型
#define kAttributeVariable          "V" //变量名称
#define kAttributeSetter            "S" //set方法名称
#define kAttributeGetter            "G" //get方法名称

@implementation ClassUtils

/**
 *  获取类中属性的类型
 *
 *  @param cls     类class
 *  @param propertyName 属性名称
 *
 *  @return 类型
 */
+ (Class)propertyClassNameWithClass:(Class)cls propertyName:(NSString *)propertyName {
    if (propertyName.length <= 0)
        return nil;
    
    unsigned int outCount, i;
    
    NSString *result;
    //从属性找
    while (cls != [NSObject class]) {
        objc_property_t *propertys = class_copyPropertyList(cls, &outCount);
        
        for (i = 0; i < outCount; ++i) {
            objc_property_t property = propertys[i];
            
            unsigned int outAttribute;
            objc_property_attribute_t *attributes= property_copyAttributeList(property, &outAttribute);
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            NSString *variableName, *getMethodName, *setMethodName, *typeName;
            
            for (int j = 0; j < outAttribute; ++j) {
                objc_property_attribute_t attribute = attributes[j];
                NSString *value = [NSString stringWithFormat:@"%s", attribute.value];
                
                if (strcmp(attribute.name, kAttributeType) == 0)
                    typeName = [[value stringByReplacingOccurrencesOfString:@"@\"" withString:@""] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                else if (strcmp(attribute.name, kAttributeVariable) == 0)
                    variableName = value;
                else if (strcmp(attribute.name, kAttributeSetter) == 0)
                    setMethodName = value;
                else if (strcmp(attribute.name, kAttributeGetter) == 0)
                    getMethodName = value;
            }
            
            if ((propertyName.length > 0 && [propertyName compare:propertyName options:NSCaseInsensitiveSearch] == NSOrderedSame)
                || (variableName.length > 0 && [variableName compare:propertyName options:NSCaseInsensitiveSearch] == NSOrderedSame)
                || (getMethodName.length > 0 && [getMethodName compare:propertyName options:NSCaseInsensitiveSearch] == NSOrderedSame)) {
                result = typeName;
            }
            else {
                NSString *propertySetMethod = [NSString stringWithFormat:@"set%@%@:", [[propertyName substringToIndex:1] capitalizedString], [propertyName substringFromIndex:1]];
                if (setMethodName.length > 0 && [setMethodName compare:propertySetMethod options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                    result = typeName;
                }
            }
            
            if (attributes)
                free(attributes);
            
            if (result.length > 0)
                break;
        }
        if (propertys)
            free(propertys);
        
        if (result.length > 0)
            break;
        
        cls = class_getSuperclass(cls);
    }
    
    return result.length > 0 ? NSClassFromString(result) : Nil;
}

@end
