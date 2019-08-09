//
//  ViewUtils.h
//  starter
//
//  Created by chenbin on 2019/8/6.
//  Copyright © 2019 nemo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewUtils : NSObject

+ (UILabel*)getLabel:(CGRect)frame fontSize:(int)fontSize boldFont:(BOOL)boldFont textColor:(UIColor*)textColor align:(NSTextAlignment)align;

+ (UIButton*)getButton:(CGRect)frame fontSize:(int)fontSize boldFont:(BOOL)boldFont textColor:(UIColor*)textColor;

@end

NS_ASSUME_NONNULL_END
