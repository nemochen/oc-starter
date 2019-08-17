//
//  NSDictionary+Model.h
//  starter
//
//  Created by nemochen on 2019/8/15.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Model)

/**
 * 将 dic 转换为 model
 */
- (id)toModel:(Class)modelClass;

@end

NS_ASSUME_NONNULL_END
