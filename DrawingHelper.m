//
//  DrawingHelper.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "DrawingHelper.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>


@implementation DrawingHelper{

}

-(void)drawCircleClockBackWith:(CGContextRef)context :(CGPoint)center :(CGFloat)radius
{
    CGColorRef fillColor = [UIColor colorWithRed:0.5 green:0.1 blue:1.0 alpha:0.2].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0 green:0 blue:0.0 alpha:1.0].CGColor;
    CGColorRef purpleColor =  [UIColor colorWithRed:0.84 green:0.75 blue:0.91 alpha:1.0].CGColor;
    CGColorRef whiteColor =  [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    CGContextAddArc(context, center.x, center.y, radius, 0, 2 * M_PI, YES);
    CGContextSetFillColorWithColor(context, fillColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
   //CGContextSetStrokeColorWithColor(context, strokeColor);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextAddArc(context, center.x, center.y, radius - ((30 * radius)/100), 0, 2 * M_PI, YES);
    CGContextSetFillColorWithColor(context,purpleColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 16.0, whiteColor);
    CGContextDrawPath(context, kCGPathFill);

}

-(void)drawRectangularClockBackWithContext:(CGContextRef)context andRect:(CGRect)rect andCornerRadius:(CGFloat)radius
{
    
    CGRect innerRect = CGRectMake(rect.origin.x + ((2 * rect.size.width) /100),
                                  rect.origin.x + ((2 * rect.size.width) /100),
                                  ((96 * rect.size.width) /100),
                                  ((96 * rect.size.width) /100));
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    CGPathCloseSubpath(path);
    CGContextAddPath(context, path);
   
    
    CGMutablePathRef innerPath = CGPathCreateMutable();
    CGPathMoveToPoint(innerPath, NULL, CGRectGetMidX(innerRect), CGRectGetMinY(innerRect));
    CGPathAddArcToPoint(innerPath, NULL, CGRectGetMaxX(innerRect), CGRectGetMinY(innerRect), CGRectGetMaxX(innerRect), CGRectGetMaxY(innerRect), radius);
    CGPathAddArcToPoint(innerPath, NULL, CGRectGetMaxX(innerRect), CGRectGetMaxY(innerRect), CGRectGetMinX(innerRect), CGRectGetMaxY(innerRect), radius);
    CGPathAddArcToPoint(innerPath, NULL, CGRectGetMinX(innerRect), CGRectGetMaxY(innerRect), CGRectGetMinX(innerRect), CGRectGetMinY(innerRect), radius);
    CGPathAddArcToPoint(innerPath, NULL, CGRectGetMinX(innerRect), CGRectGetMinY(innerRect), CGRectGetMaxX(innerRect), CGRectGetMinY(innerRect), radius);
    CGPathCloseSubpath(innerPath);
   
    
    CGFloat colors1 [] = {
        0.4, 0.2, 0.9, 1.0,
        1.5, 0.5, 0.9, 1.0
    };
    
    CGFloat colors2 [] = {
        
        1.5, 0.5, 0.9, 1.0,
        0.4, 0.2, 0.9, 1.0
           };

    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors1, NULL, 2);
  
    CGContextSaveGState(context);
    CGContextClip(context);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
  
    CGContextDrawPath(context, kCGPathFill);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextAddPath(context, innerPath);
    CGContextClip(context);

    gradient = CGGradientCreateWithColorComponents(baseSpace, colors2, NULL, 2);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextDrawPath(context, kCGPathStroke);
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    CGGradientRelease(gradient), gradient = NULL;
    
}

@end
