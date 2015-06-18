# BZYStrokeTimer

[![CI Status](http://img.shields.io/travis/startupthekid/BZYStrokeTimer.svg?style=flat)](https://travis-ci.org/busycm/BZYStrokeTimer)
[![Version](https://img.shields.io/cocoapods/v/BZYStrokeTimer.svg?style=flat)](http://cocoapods.org/pods/BZYStrokeTimer)
[![License](https://img.shields.io/cocoapods/l/BZYStrokeTimer.svg?style=flat)](http://cocoapods.org/pods/BZYStrokeTimer)
[![Platform](https://img.shields.io/cocoapods/p/BZYStrokeTimer.svg?style=flat)](http://cocoapods.org/pods/BZYStrokeTimer)

##Description

`BZYStrokeTimer` is an awesome and beautifully simple timer built off `CAShapeLayer`.

<img src="https://github.com/busycm/BZYStrokeTimer/blob/master/demo.gif" align="center" height="300">

You can also pause and resume the timer as you see fit.

<img src="https://github.com/busycm/BZYStrokeTimer/blob/master/pause_demo.gif" align="center" height="300">

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

`BZYStrokeTimer` is highly customizable and comes with a large set of delegate methods for you to use.
There are four main methods, all of which are self-explanatory:
```objc
- (void)start;
- (void)pause;
- (void)resume;
- (void)start;
```
`BZYStrokeTimer` supports the `IB_DESIGNABLE` protocol so you can fiddle with it right in a storyboard or nib without having to keep building your project!

The following properties support `IBInspectable`:
```objc
@property (nonatomic) IBInspectable CGFloat progress;
@property (nonatomic) IBInspectable UIColor *timerColor; //Defaults to [UIColor blackColor]
@property (nonatomic) IBInspectable CGFloat lineWidth;   //Defaults to 10.0
```
Other options include:
```objc
@property (nonatomic) NSString *timingFunction; //defaults to kCAMediaTimingFunctionEaseInEaseOut
@property (nonatomic) NSTimeInterval duration;  //defaults at 5.0
```
There are two ways to use `BZYStrokeTimer`, with or without animations.

###Animating

Set all your desired properties, either through storyboard or programatically like so:
```objc
self.strokeTimer.duration = 10.0;
self.strokeTimer.timerColor = [UIColor blueColor];
self.strokeTimer.lineWidth = 5.0;
```
Then call `start`.

Example with `UILongPressGestureRecognizer`
```objc
- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateBegan) {
        if(self.strokeTimer.isPaused) [self.strokeTimer resume];
        if(!self.strokeTimer.isRunning) [self.strokeTimer start];
    } else if((gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled) && self.strokeTimer.isRunning) {
        [self.strokeTimer pause];
    }
}
```
###Manually

If you want to use the timer to represent the progress of a task, say a network download, you can manually set the `progress` property, which ranges from 0.0 to 1.0 as the task continues.

###Delegate

`BZYStrokeTimerDelegate` includes the following optional functions:
```objc
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
```
All the `BOOL` methods default to `YES`.

## Requirements

## Installation

BZYStrokeTimer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BZYStrokeTimer"
```

## Authors
[startupthekid](https://github.com/startupthekid) ([conronb@gmail.com](mailto:conronb@gmail.com)) && [ruddfawcett](https://github.com/ruddfawcett) ([rudd@ruddfawcett.com](mailto:rudd@ruddfawcett.com))

## License

BZYStrokeTimer is available under the MIT license. See the LICENSE file for more info.
