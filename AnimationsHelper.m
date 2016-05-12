//
//  AnimationsHelper.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "AnimationsHelper.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@implementation AnimationsHelper
{
    CGFloat secondsAngle;
    CGFloat minutesAngle;
    CGFloat hoursAngle;
    BOOL initializedSeconds;
    BOOL initializedMinutes;
    BOOL initializedHours;
}

-(instancetype)init
{
    self = [super init];
    if(self){
       
    }
    return self;
}

-(void)rotateSeconds:(NSTimer*)timer
{
    CALayer* l = [timer userInfo];
    CATransform3D t = CATransform3DIdentity;

    if(secondsAngle == 6.28318531f){
        secondsAngle = 0.0f;
    }
    if(!initializedSeconds){
        CGFloat rotationRadians = [(NSNumber *)[l valueForKeyPath:@"transform.rotation.z"] floatValue];
        secondsAngle = rotationRadians;
        initializedSeconds = YES;
    }
    secondsAngle += 0.104719755;
    
       t= CATransform3DMakeRotation(secondsAngle, 0, 0, 1);
  
        [UIView animateWithDuration:1.0
                     animations:^{
                         CALayer* l = [timer userInfo];
                         l.transform = t;

    }
                     completion:nil];
}

-(void)rotateSecondsWithSpring:(NSTimer*)timer
{
    CALayer* l = [timer userInfo];
    if(secondsAngle == 6.28318531f){
        secondsAngle = 0.0f;
}
    if(!initializedSeconds){
        CGFloat rotationRadians = [(NSNumber *)[l valueForKeyPath:@"transform.rotation.z"] floatValue];
        secondsAngle = rotationRadians;
        initializedSeconds = YES;
    }
    
    secondsAngle +=  0.104719755f;
    CGFloat offset = 0.010000000f;
    CAKeyframeAnimation * keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    [keyframeAnimation setValues:[NSArray arrayWithObjects:
                                  [NSNumber numberWithFloat:secondsAngle],
                                  [NSNumber numberWithFloat:((secondsAngle + offset))],
                                  [NSNumber numberWithFloat:((secondsAngle - offset))],
                                  [NSNumber numberWithFloat:((secondsAngle + offset))],
                                  [NSNumber numberWithFloat:((secondsAngle - offset))],
                                  [NSNumber numberWithFloat:(secondsAngle)], nil]];
    [keyframeAnimation setKeyTimes: [NSArray arrayWithObjects:
                                    [NSNumber numberWithFloat:0.0],
                                    [NSNumber numberWithFloat:0.1],
                                    [NSNumber numberWithFloat:0.15],
                                    [NSNumber numberWithFloat:0.25],
                                    [NSNumber numberWithFloat:0.35],
                                    [NSNumber numberWithFloat:0.45], nil]];
    [keyframeAnimation setDuration:1.0];
    [l addAnimation:keyframeAnimation forKey:@"transform.rotation.z"];
    l.transform = CATransform3DMakeRotation(secondsAngle, 0, 0, 1);
  }

-(void)rotateMinutes:(NSTimer*)timer
{
    CALayer* l = [timer userInfo];
    CATransform3D t = CATransform3DIdentity;
    
    if(minutesAngle == 360.0f){
        minutesAngle = 0.0f;
    }
    if(!initializedMinutes){
        CGFloat rotationRadians = [(NSNumber *)[l valueForKeyPath:@"transform.rotation.z"] floatValue];
        CGFloat rotationDegrees = rotationRadians * (180.0f/M_PI);
        minutesAngle = rotationDegrees;

        initializedMinutes = YES;
    }
    minutesAngle += 6.0;
    
    t= CATransform3DMakeRotation(minutesAngle * M_PI / 180.0f, 0, 0, 1);
    
    [UIView animateWithDuration:60.0
                     animations:^{
                         
                         l.transform = t;
                     }
                     completion:nil];

}

-(void)rotateHours:(NSTimer*)timer
{
    CALayer* l = [timer userInfo];
     CATransform3D t = CATransform3DIdentity;
    if(hoursAngle == 360.0f){
        hoursAngle = 0.0f;
    }
    if(!initializedHours){
        CGFloat rotationRadians = [(NSNumber *)[l valueForKeyPath:@"transform.rotation.z"] floatValue];
        CGFloat rotationDegrees = rotationRadians * (180.0f/M_PI);
        hoursAngle = rotationDegrees;

        initializedHours = YES;
    }
    
    hoursAngle += 6.0f;
    t= CATransform3DMakeRotation(hoursAngle * M_PI / 180.0f, 0, 0, 1);
    
    [UIView animateWithDuration:360.0
                     animations:^{
                        l.transform = t;
                     }
                     completion:nil];
}
@end
