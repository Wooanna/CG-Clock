//
//  HoursLayer.h
//  CGClock
//
//  Created by Yoanna Mareva on 2/5/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface HoursLayer : CALayer

-(instancetype)initWithCenter:(CGPoint)center andRadius:(CGFloat)radius;
-(void)drawHours;

@end
