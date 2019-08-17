//
//  NetEngine.h
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>

// 宏定义 Http 请求成功 block
typedef void (^NetSuccess)(id model);
// 宏定义 Http 请求失败 block
typedef void (^NetFailure)(NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface NetEngine : NSObject

SINGLE_INSTANCE_DECLARE(NetEngine)

- (void)requestLiveDetail:(int)raceId success:(NetSuccess)success fail:(NetFailure)fail;

@end

NS_ASSUME_NONNULL_END
