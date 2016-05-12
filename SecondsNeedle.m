//
//  SecondsNeedle.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "SecondsNeedle.h"

@implementation SecondsNeedle

-(instancetype)initWithRadius:(CGFloat)radius
{
    self = [super init];
    if(self){
    if(!self.length){
        self.length = (75* radius)/100;

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
    
    CGPathMoveToPoint(path, nil, self.width/2, 0);
    CGPathAddLineToPoint(path, nil, 0, self.length / 4);
    CGPathAddLineToPoint(path, nil, self.width / 4, self.length / 4);
    CGPathAddLineToPoint(path, nil, self.width / 4, self.length);
   
    CGPathAddLineToPoint(path, nil, (self.width / 4) * 3, self.length);
    CGPathAddLineToPoint(path, nil, (self.width / 4) * 3, self.length / 4);
    CGPathAddLineToPoint(path, nil, self.width , self.length / 4);
    CGPathMoveToPoint(path, nil, self.width/2, 0);
     CGPathAddArc(path, nil, self.position.x, self.position.y, 6, 2 * M_PI, 0, YES);
    CGPathCloseSubpath(path);
  
    self.path = path;
    self.fillColor = [UIColor colorWithRed:0.8 green:0.4 blue:0.1 alpha:1].CGColor;

}
@end
