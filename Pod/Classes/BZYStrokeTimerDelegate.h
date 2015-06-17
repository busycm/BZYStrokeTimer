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
- (void)strokeTimerWillStart:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerDidStart:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerWillPause:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerDidPause:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerWillResume:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerDidResume:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerWillStop:(BZYStrokeTimer *)strokeTimer;
- (void)strokeTimerDidStop:(BZYStrokeTimer *)strokeTimer;

- (BOOL)strokeTimerShouldStart:(BZYStrokeTimer *)strokeTimer;
- (BOOL)strokeTimerShouldPause:(BZYStrokeTimer *)strokeTimer;
- (BOOL)strokeTimerShouldResume:(BZYStrokeTimer *)strokeTimer;
@end
