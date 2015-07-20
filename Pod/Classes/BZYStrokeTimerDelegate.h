//
//  BZYStrokeTimerDelegate.h
//  Busy
//
//  Created by Brendan Conron on 6/17/15.
//  Copyright (c) 2015 Busy, LLC. All rights reserved.
//

@import Foundation;
@import UIKit;

@class BZYStrokeTimer;

@protocol BZYStrokeTimerDelegate <NSObject>

@optional

/**
 *  Called before the timer starts.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerWillStart:(BZYStrokeTimer *)strokeTimer;
/**
 *  Called when the timer starts.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerDidStart:(BZYStrokeTimer *)strokeTimer;

/**
 *  Called before the timer pauses.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerWillPause:(BZYStrokeTimer *)strokeTimer;
/**
 *  Called when the timer pauses.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerDidPause:(BZYStrokeTimer *)strokeTimer;

/**
 *  Called before the timer resumes.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerWillResume:(BZYStrokeTimer *)strokeTimer;
/**
 *  Called when the timer resumes.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerDidResume:(BZYStrokeTimer *)strokeTimer;

/**
 *  Called before the timer stops.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerWillStop:(BZYStrokeTimer *)strokeTimer;
/**
 *  Called when the timer stops.
 *
 *  @param strokeTimer The timer.
 */
- (void)strokeTimerDidStop:(BZYStrokeTimer *)strokeTimer;

/**
 *  Called as the timer advances.
 *
 *  @param strokeTimer The timer.
 *  @param progress    The progress of the timer.
 */
- (void)strokeTimer:(BZYStrokeTimer *)strokeTimer didAdvanceWithProgress:(CGFloat)progress;

#pragma mark - Boolean Delegate Methods

/**
 *  Called before the timer is about to start, and says whether or not it should start.
 *
 *  @param strokeTimer The timer.
 *
 *  @return Whether or not the timer should start.
 */
- (BOOL)strokeTimerShouldStart:(BZYStrokeTimer *)strokeTimer;
/**
 *  Called before the timer is about to pause, and says whether or not it should pause.
 *
 *  @param strokeTimer The timer.
 *
 *  @return Whether or not the timer should pause.
 */
- (BOOL)strokeTimerShouldPause:(BZYStrokeTimer *)strokeTimer;
/**
 *  Called before the timer is about to resume, and says whether or not it should resume.
 *
 *  @param strokeTimer The timer.
 *
 *  @return Whether or not the timer should resume.
 */
- (BOOL)strokeTimerShouldResume:(BZYStrokeTimer *)strokeTimer;

@end
