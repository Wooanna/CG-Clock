//
//  HoursLayer.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/5/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "HoursLayer.h"
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@implementation HoursLayer{

    NSArray* _positionsX;
    NSArray* _positionsY;
    CGFloat offset;
}

-(instancetype)initWithCenter:(CGPoint)center andRadius:(CGFloat)radius
{
    self = [super init];
    if(self){
        offset = (10 * radius)/100;
        _positionsX = [NSArray arrayWithObjects:@(center.x - radius + offset), @(center.x +radius - offset), @(center.x), @(center.x), nil];
        _positionsY = [NSArray arrayWithObjects:@(center.y), @(center.y), @(center.y + radius - offset), @(center.y - radius + offset), nil];

    }
  
    return self;
}



-(void)drawHours
{
    CGContextRef ctxHours = UIGraphicsGetCurrentContext();

    for (int i = 0; i < 4 ; i++) {
        
        CGColorRef fillColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
        CGFloat indexRadius = 3;
        CGContextAddArc(ctxHours, [[_positionsX objectAtIndex:i ] floatValue] , [[_positionsY objectAtIndex:i ] floatValue], indexRadius, 0, 2 * M_PI, YES);
        CGContextSetFillColorWithColor(ctxHours, fillColor);
        
        CGContextDrawPath(ctxHours, kCGPathFill);
    }
}
@end
