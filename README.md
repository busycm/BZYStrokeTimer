# BZYStrokeTimer

[![CI Status](http://img.shields.io/travis/startupthekid/BZYStrokeTimer.svg?style=flat)](https://travis-ci.org/busycm/BZYStrokeTimer)
[![Version](https://img.shields.io/cocoapods/v/BZYStrokeTimer.svg?style=flat)](http://cocoapods.org/pods/BZYStrokeTimer)
[![License](https://img.shields.io/cocoapods/l/BZYStrokeTimer.svg?style=flat)](http://cocoapods.org/pods/BZYStrokeTimer)
[![Platform](https://img.shields.io/cocoapods/p/BZYStrokeTimer.svg?style=flat)](http://cocoapods.org/pods/BZYStrokeTimer)

##Description

`BZYStrokeTimer` is an awesome and beautifully simple timer built off `CAShapeLayer`.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

`BZYStrokeTimer` is highly customizable and comes with a large set of delegate methods for you to use.
There are four main methods, all of which are self explanitory:

    - (void)start;
    - (void)pause;
    - (void)resume;
    - (void)start;

`BZYStrokeTimer` supports the `IB_DESIGNABLE` protocol so you can fiddle with it right in a storyboard or nib without having to keep building your project!

The following properties support `IBInspectable`:

    @property (nonatomic) IBInspectable CGFloat progress;
    @property (nonatomic) IBInspectable UIColor *timerColor; //Defaults to [UIColor blackColor]
    @property (nonatomic) IBInspectable CGFloat lineWidth;   //Defaults to 10.0

Other options include:

    @property (nonatomic) NSString *timingFunction; //defaults to kCAMediaTimingFunctionEaseInEaseOut
    @property (nonatomic) NSTimeInterval duration;  //defaults at 5.0

There are two ways to use `BZYStrokeTimer`, with or without animations.

###Animating

Set all your desired properties, either 

## Requirements

## Installation

BZYStrokeTimer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BZYStrokeTimer"
```

## Authors

startupthekid, conronb@gmail.com

ruddfawcett, rudd@ruddfawcett.com

## License

BZYStrokeTimer is available under the MIT license. See the LICENSE file for more info.
