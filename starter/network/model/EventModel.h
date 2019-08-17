//
//  EventModel.h
//  starter
//
//  Created by nemochen on 2019/8/17.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventModel : NSObject
@property (nonatomic, copy) NSString * t;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * en_content;
@property (nonatomic, copy) NSString * status;
@end

NS_ASSUME_NONNULL_END
