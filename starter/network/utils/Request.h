//
//  Request.h
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

/**
 *  Request 封装类
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Request : NSObject
// 请求链接
@property (copy) NSString * urlString;
// 请求方法 GET / POST
@property (nonatomic, copy) NSString * method;
// 参数 dic
@property (strong) NSMutableDictionary * paramDic;
// header dic
@property (strong) NSMutableDictionary * headerDic;

@end

NS_ASSUME_NONNULL_END
