//
//  ApiManager.m
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "ApiManager.h"
#import "AFNetworking.h"

@implementation ApiManager

SINGLE_INSTANCE_IMPLEMENTION(ApiManager)

- (void) request: (Request*) request success:(ApiSuccess)success failure:(ApiFailure)failure {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSString * url = request.urlString;
    NSDictionary * params = request.paramDic;
    
    if ([request.method isEqualToString:@"GET"]) {
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable response) {
            success(response);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    } else if ([request.method isEqualToString:@"POST"]) {
        [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable response) {
            success(response);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

@end
