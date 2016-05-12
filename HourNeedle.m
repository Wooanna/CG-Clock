//
//  HourNeedle.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "HourNeedle.h"

@implementation HourNeedle

-(instancetype)initWithRadius:(CGFloat)radius
{
    self = [super init];
    if(self){
    if(!self.length){
        self.length =  (60* radius)/100;
    }
    if(!self.width){
        self.width = 6;
    }
        [self setAnchorPoint:CGPointMake(0.5, 0.95)];
        [self setFrame:CGRectMake(0, 0, self.width , self.length)];
        self.shadowColor = [UIColor blackColor].CGColor;
        self.shadowOffset = CGSizeMake(1, 1);
        self.shadowRadius = 1;
        self.shadowOpacity = 0.5;
    }
    [self createPath];
    return self;
}

-(void)createPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, nil, self.width/2, self.length/2);
    CGPathAddLineToPoint(path, nil, self.width, self.length);
    CGPathAddLineToPoint(path, nil, 0, self.length);
    CGPathAddLineToPoint(path, nil, 0, self.length);
    CGPathAddLineToPoint(path, nil, self.width/2, self.length/2);
    CGPathCloseSubpath(path);
    self.path = path;
}

@end
