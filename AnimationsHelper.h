//
//  AnimationsHelper.h
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationsHelper : NSObject

-(void)rotateSeconds:(CALayer*)layer;

-(void)rotateSecondsWithSpring:(CALayer*)layer;

-(void)rotateMinutes:(CALayer*)layer;

-(void) rotateHours:(CALayer*)layer;

@end
