//
//  Clock.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "Clock.h"
#import "DrawingHelper.h"
#import "Needle.h"
#import "MinuteNeedle.h"
#import "HourNeedle.h"
#import "SecondsNeedle.h"
#import "AnimationsHelper.h"
#import "HoursLayer.h"

@implementation Clock
{
    DrawingHelper *_drawer;
    Needle  *_minuteNeedle;
    Needle  *_hoursNeedle;
    Needle *_secondsNeedle;
    AnimationsHelper *_animator;
    CGFloat secondsAngle;
    CGFloat minutesAngle;
    CGFloat hoursAngle;
    HoursLayer *_hoursLayer;
   
    
}

const int DEFAULT_CORNER_RADIUS = 30;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _minuteNeedle = [[MinuteNeedle alloc] initWithRadius:self.bounds.size.width/2];
        _hoursNeedle = [[HourNeedle alloc]  initWithRadius:self.bounds.size.width/2];
        _secondsNeedle = [[SecondsNeedle alloc]  initWithRadius:self.bounds.size.width/2];
        
        [_minuteNeedle setPosition: CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2)];
        [self.layer addSublayer:_minuteNeedle];
        
        [_hoursNeedle setPosition: CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2)];
        [self.layer addSublayer:_hoursNeedle];

        [_secondsNeedle setPosition: CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2)];
        [self.layer addSublayer:_secondsNeedle];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(void)start
{
    _animator = [[AnimationsHelper alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:_animator selector:@selector(rotateSecondsWithSpring:) userInfo:_secondsNeedle repeats:YES];
}

-(void)startMinutes
{
   [NSTimer scheduledTimerWithTimeInterval:0 target:_animator selector:@selector(rotateMinutes:) userInfo:_minuteNeedle repeats:NO];
   [NSTimer scheduledTimerWithTimeInterval:60.0 target:_animator selector:@selector(rotateMinutes:) userInfo:_minuteNeedle repeats:YES];
}

-(void)startHours
{
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:_animator selector:@selector(rotateHours:) userInfo:_hoursNeedle repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:360.0 target:_animator selector:@selector(rotateHours:) userInfo:_hoursNeedle repeats:YES];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
        float precentage = (10* self.bounds.size.width / 2)/100;
    CGFloat radius = self.bounds.size.width / 2 - precentage;

    _drawer = [DrawingHelper new];
    if(self.faceMode == FaceModeCircular){
    [_drawer drawCircleClockBackWith:ctx :CGPointMake(self.bounds.size.width / 2, self.bounds.size.width / 2) :radius];
    }
    else if(self.faceMode == FaceModeRectangular){
        [_drawer drawRectangularClockBackWithContext:ctx andRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width) andCornerRadius:DEFAULT_CORNER_RADIUS];
    }
     _hoursLayer = [[HoursLayer alloc] initWithCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.width / 2) andRadius:radius];
    [_hoursLayer drawHours];
    [self initAngles];
}

-(void)initAngles
{
    
    NSDate* dateTimeNow = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour| NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:dateTimeNow];
    NSInteger second = [components second];
    NSInteger minute = [components minute];
    NSInteger hour = [components hour];
    
    secondsAngle = second * 6.0f;
    minutesAngle = minute * 6.0f;
    hoursAngle = hour * 6.0f;
    
    [NSTimer scheduledTimerWithTimeInterval:60 - second target:self selector:@selector(startMinutes) userInfo:_minuteNeedle repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:60 - minute target:self selector:@selector(startHours) userInfo:_hoursNeedle repeats:NO];

    [self updateTime];
}


-(void)updateTime
{
    _secondsNeedle.transform = CATransform3DMakeRotation(secondsAngle * M_PI / 180.0f, 0, 0, 1);
    _minuteNeedle.transform = CATransform3DMakeRotation(minutesAngle * M_PI / 180.0f, 0, 0, 1);
    _hoursNeedle.transform = CATransform3DMakeRotation(hoursAngle * M_PI / 180.0f, 0, 0, 1);
}

@end
