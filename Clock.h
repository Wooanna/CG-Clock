//
//  Clock.h
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Clock : UIView

-(void)start;

typedef NS_ENUM(NSInteger, FaceMode)
{
    FaceModeCircular,
    FaceModeRectangular,
    GradientTypeWhiteGradient,
    GradientTypeTurquoiseGradient
};

@property (nonatomic)FaceMode faceMode;

@end
