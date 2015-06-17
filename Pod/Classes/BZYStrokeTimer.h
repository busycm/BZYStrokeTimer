//
//  BZYStrokeTimer.h
//  Busy
//
//  Created by Rudd Fawcett on 6/11/15.
//  Copyright (c) 2015 Busy, LLC. All rights reserved.
//

@import UIKit;

#import "BZYStrokeTimerDelegate.h"

IB_DESIGNABLE
@interface BZYStrokeTimer : UIView

#pragma mark - Timer Customization

@property (nonatomic) IBInspectable CGFloat progress;
@property (nonatomic) IBInspectable UIColor *timerColor;
@property (nonatomic) IBInspectable CGFloat timerWidth;

/**
 *  Duration of the animation.
 */
@property (nonatomic) NSTimeInterval duration;
/**
 *  The elapsed time of the animation so far.
 */
@property (nonatomic, readonly) NSTimeInterval elapsedTime;
/**
 *  Percent of animation completed. Calculated as elapsedTime/duration;
 */
@property (nonatomic, readonly) CGFloat animationCompletion;

#pragma mark - Timer State

@property (nonatomic, getter=isRunning, readonly) BOOL running;
@property (nonatomic, getter=isPaused, readonly)  BOOL paused;

#pragma mark - BZYStrokeTimerDelegate

@property (nonatomic, weak) id<BZYStrokeTimerDelegate> delegate;

#pragma mark - Animation

- (void)start;
- (void)pause;
- (void)resume;
- (void)stop;

@end
