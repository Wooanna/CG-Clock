//
//  Needle.h
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Needle : CAShapeLayer

@property (nonatomic) CGFloat length;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGColorRef color;

@property (nonatomic) CGFloat rotationAngle;

-(instancetype)initWithRadius:(CGFloat)radius;

@end
