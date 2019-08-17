//
//  ViewUtils.m
//  starter
//
//  Created by chenbin on 2019/8/6.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils

+ (UILabel*)getLabel:(CGRect)frame fontSize:(int)fontSize boldFont:(BOOL)boldFont textColor:(UIColor*)textColor align:(NSTextAlignment)align {
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = align;
    label.backgroundColor = [UIColor clearColor];
    UIFont * textFont = [UIFont systemFontOfSize:fontSize];
    if (boldFont) {
        textFont = [UIFont boldSystemFontOfSize:fontSize];
    }
    label.font = textFont;
    label.textColor = textColor;
    return label;
}

+ (UIButton*)getButton:(CGRect)frame fontSize:(int)fontSize boldFont:(BOOL)boldFont textColor:(UIColor*)textColor {
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    if (boldFont) {
        button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    }
    [button setTitleColor:textColor forState:UIControlStateNormal];
    return button;
}

@end
