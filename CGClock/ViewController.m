//
//  ViewController.m
//  CGClock
//
//  Created by Yoanna Mareva on 2/4/15.
//  Copyright (c) 2015 Yoanna Mareva. All rights reserved.
//

#import "ViewController.h"
#import "Clock.h"

@interface ViewController ()

@end

@implementation ViewController
{
    Clock* _clock;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _clock = [[Clock alloc] initWithFrame:CGRectMake(22, 24, self.view.bounds.size.width, self.view.bounds.size.height)];
    _clock.faceMode = FaceModeCircular;
    [_clock start];
    [self.view addSubview:_clock];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
