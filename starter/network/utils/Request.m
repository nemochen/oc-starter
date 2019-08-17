//
//  Request.m
//  starter
//
//  Created by nemochen on 2019/8/14.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "Request.h"

@implementation Request

-(instancetype)init{
    if (self = [super init]) {
        self.method = @"GET";
        self.paramDic = [[NSMutableDictionary alloc] init];
        self.headerDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) setMethod:(NSString *)method {
    NSAssert([@"GET" isEqualToString: method] || [@"POST" isEqualToString: method], @"请求方法错误！");
    _method = method;
}

@end
