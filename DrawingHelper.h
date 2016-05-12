//
//  DrawingHelper.h
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface DrawingHelper : NSObject

-(void)drawCircleClockBackWith:(CGContextRef)context :(CGPoint)center :(CGFloat)radius;

-(void)drawRectangularClockBackWithContext:(CGContextRef)context andRect:(CGRect)rect andCornerRadius:(CGFloat)radius;

@property CGColorRef rectangularClockColorUp;
@property CGColorRef rectangularClockColorBottom;

@end
