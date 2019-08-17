//
//  ClassUtils.h
//  starter
//
//  Created by nemochen on 2019/8/16.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassUtils : NSObject

/**
 *  获取类中属性的类型
 *
 *  @param cls     类结构
 *  @param propertyName 属性名称
 *
 *  @return 类型
 */
+ (Class)propertyClassNameWithClass:(Class)cls propertyName:(NSString *)propertyName;

@end

NS_ASSUME_NONNULL_END
