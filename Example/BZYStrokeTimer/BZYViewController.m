//
//  BZYViewController.m
//  BZYStrokeTimer
//
//  Created by startupthekid on 06/17/2015.
//  Copyright (c) 2014 startupthekid. All rights reserved.
//

#import "BZYViewController.h"

#import "BZYStrokeTimer.h"

@interface BZYViewController ()

@property (weak, nonatomic) IBOutlet BZYStrokeTimer *strokeTimer;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;

@end

@implementation BZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup & Configuration

- (void)setup {
    self.strokeTimer.duration = 5;
    self.strokeTimer.lineWidth = 5;
    self.strokeTimer.clockwise = NO;
    self.strokeTimer.unwinds = YES;
    [self.longPressGesture addTarget:self action:@selector(handleLongPress:)];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

#pragma mark - Gesture Handler

- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (self.strokeTimer.isPaused) {
            [self.strokeTimer resume];
        }
        
        if (!self.strokeTimer.isRunning) {
            [self.strokeTimer start];
        }
    } else if ((gesture.state == UIGestureRecognizerStateEnded ||
                gesture.state == UIGestureRecognizerStateFailed ||
                gesture.state == UIGestureRecognizerStateCancelled) && self.strokeTimer.isRunning) {
        [self.strokeTimer pause];
    }
}

@end
