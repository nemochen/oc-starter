//
//  ApiManager.h
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

/**
 *  该类只负责做 AFNetworking 请求，可以统一公共信息（eg: header）
 */

#import <Foundation/Foundation.h>
#import "Request.h"

// 宏定义网络请求成功 block
typedef void (^ApiSuccess)(_Nullable id response);
// 宏定义网络请求失败 block
typedef void (^ApiFailure)(NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface ApiManager : NSObject

SINGLE_INSTANCE_DECLARE(ApiManager)

- (void) request:(Request*) request success:(ApiSuccess)success failure:(ApiFailure)failure;

@end

NS_ASSUME_NONNULL_END
