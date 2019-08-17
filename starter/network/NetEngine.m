//
//  NetEngine.m
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "NetEngine.h"
#import "ApiManager.h"
#import "Request.h"
#import "ModelHeader.h"
#import "NSDictionary+Model.h"

@implementation NetEngine

SINGLE_INSTANCE_IMPLEMENTION(NetEngine)

#pragma mark --- private method ---
- (void)request:(NSString*)method url:(NSString*)url params:(NSDictionary*)params model:(Class)model success:(NetSuccess)success fail:(NetFailure)fail {
    Request * request = [[Request alloc] init];
    request.method = method;
    request.urlString = url;
    [request.paramDic setDictionary:params];
    [[ApiManager shareInstance] request:request success:^(id response) {
        int code = [[response objectForKey:@"code"] intValue];
        if (code == 200) {
            if (success) {
                success([self data2Model:[response objectForKey:@"data"] class:model]);
            }
        } else {
            if (fail) {
                NSError * error = [[NSError alloc] initWithDomain:NSURLErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"本地化的错误描述"}];
                fail(error);
            }
        }
    } failure:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}

/**
 * 将 dic 或者 array 转换为 model 类型
 */
- (id)data2Model:(id)data class:(Class)class {
    if ([data isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary*)data toModel:class];
    } else if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray * array = [NSMutableArray array];
        for (int i = 0; i < ((NSArray*)data).count; i++) {
            id tmpData = ((NSArray*)data)[i];
            if ([tmpData isKindOfClass:[NSDictionary class]]) {
                [array addObject:[(NSDictionary*)data toModel:class]];
            }
        }
        return array;
    }
    
    return nil;
}

#pragma mark --- public method ---
- (void)requestLiveDetail:(int)raceId success:(NetSuccess)success fail:(NetFailure)fail {
    NSString * url = [NSString stringWithFormat:@"%@%@", BASE_URL_PRODUCT, @"url-suffix"];
    [self request:@"GET" url:url params:@{@"race_id": [NSNumber numberWithInt:raceId]} model:[LiveEventModel class] success:success fail:fail];
}

@end
