//
//  BZYStrokeTimer.m
//  Busy
//
//  Created by Rudd Fawcett on 6/11/15.
//  Copyright (c) 2015 Busy, LLC. All rights reserved.
//

#import "BZYStrokeTimer.h"

@interface BZYStrokeTimer () {
    UIColor *_timerColor;
}

#define kDefaultLineWidth 10.0f
#define kDefaultDuration 5.0f

@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@property (strong, nonatomic) NSTimer *animationTimer;

@end

@implementation BZYStrokeTimer

- (instancetype) init {
    if(self = [super init] ) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
//    self.progress = 0.0f;
    [self.layer addSublayer:self.shapeLayer];
}

#pragma mark - Timing

- (void)timerFired:(NSTimer *)sender {
    if(!self.paused) _elapsedTime += 0.01;
    if(_elapsedTime >= _duration) {
        [self.animationTimer invalidate];
        self.animationTimer = nil;
        [self stop];
    }
}

#pragma mark - Animation

- (void)start {
    //Check for and send delegate methods
    if([_delegate respondsToSelector:@selector(strokeTimerShouldStart:)]) {
        if(![_delegate strokeTimerShouldStart:self]) return;
    }
    if([_delegate respondsToSelector:@selector(strokeTimerWillStart:)]) [_delegate strokeTimerWillStart:self];
    _running = YES;
    _paused = NO;
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    self.shapeLayer.strokeEnd = 1;
    //generate the animation
    CABasicAnimation *wind = [self generateAnimationWithDuration:self.duration == 0 ? kDefaultDuration : self.duration FromValue:@(self.shapeLayer.strokeStart) toValue:@(self.shapeLayer.strokeEnd) withKeypath:@"strokeEnd" withFillMode:kCAFillModeForwards];
    wind.timingFunction= [CAMediaTimingFunction functionWithName:self.timingFunction];
    wind.removedOnCompletion=NO;
    //add the animation 
    [self.shapeLayer addAnimation:wind forKey:@"strokeEndAnimation"];
    if([_delegate respondsToSelector:@selector(strokeTimerDidStart:)]) [_delegate strokeTimerDidStart:self];
}

- (void)pause {
    if([_delegate respondsToSelector:@selector(strokeTimerShouldPause:)]) {
        if(![_delegate strokeTimerShouldPause:self]) return;
    }
    
    if([_delegate respondsToSelector:@selector(strokeTimerWillPause:)]) [_delegate strokeTimerWillPause:self];
    
    CFTimeInterval pausedTime = [self.shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.shapeLayer.speed = 0.0;
    self.shapeLayer.timeOffset = pausedTime;
    _paused = YES;
    _running = NO;
    
    if([_delegate respondsToSelector:@selector(strokeTimerDidPause:)]) [_delegate strokeTimerDidPause:self];
}

- (void)resume {
    
    if([_delegate respondsToSelector:@selector(strokeTimerShouldResume:)]){
        if(![_delegate strokeTimerShouldResume:self]) return;
    }
    if([_delegate respondsToSelector:@selector(strokeTimerWillResume:)]) [_delegate strokeTimerWillResume:self];
    
    CFTimeInterval pausedTime = [self.shapeLayer timeOffset];
    self.shapeLayer.speed = 1.0;
    self.shapeLayer.timeOffset = 0.0;
    self.shapeLayer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.shapeLayer.beginTime = timeSincePause;
    _paused = NO;
    _running = YES;
    
    if([_delegate respondsToSelector:@selector(strokeTimerDidResume:)]) [_delegate strokeTimerDidResume:self];
}

- (void)stop {
    
    if([_delegate respondsToSelector:@selector(strokeTimerWillStop:)]) [_delegate strokeTimerWillStop:self];
    
    _running = NO;
    _paused = NO;
    _elapsedTime = 0.0;
    
    [self.shapeLayer removeAnimationForKey:@"strokeEndAnimation"];
    
    if([_delegate respondsToSelector:@selector(strokeTimerDidStop:)]) [_delegate strokeTimerDidStop:self];
}

- (CGSize)intrinsicContentSize {
    return self.shapeLayer.bounds.size;
}

//- (void)prepareForInterfaceBuilder {
//    self.progress = 0.5;
//}

#pragma mark - Helpers

- (CABasicAnimation *)generateAnimationWithDuration:(NSTimeInterval)duration FromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue withKeypath:(NSString *)keyPath withFillMode:(NSString *)fillMode {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.duration = duration;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.fillMode = fillMode;
    return animation;
}

- (UIBezierPath *)generatePathWithXInset:(CGFloat)dx withYInset:(CGFloat)dy {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), dy)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds)-dx, dy)];
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds)-dx, CGRectGetMaxY(self.bounds)-dy)];
    [path addLineToPoint:CGPointMake(dx, CGRectGetMaxY(self.bounds)-dy)];
    [path addLineToPoint:CGPointMake(dx, dy)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), dy)];
    return path;
}

#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.shapeLayer.path = [self generatePathWithXInset:self.shapeLayer.lineWidth/2 withYInset:self.shapeLayer.lineWidth/2].CGPath;
}

#pragma mark - Properties

#pragma mark Property Getters

- (CAShapeLayer *)shapeLayer {
    return !_shapeLayer ? _shapeLayer = ({
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineWidth = kDefaultLineWidth;
        layer.fillColor = UIColor.clearColor.CGColor;
        layer.strokeColor = [UIColor blackColor].CGColor;
        layer.lineCap = kCALineCapSquare;
        layer.frame = self.bounds;
        layer.strokeStart = 0;
        layer.strokeEnd = 0;
        layer;
    }) : _shapeLayer;
}

#pragma mark Property Getters

- (UIColor *)timerColor {
    return !_timerColor ? _timerColor = [UIColor blackColor] : _timerColor;
}

- (CGFloat)progress {
    return self.shapeLayer.strokeEnd;
}

- (CGFloat)animationCompletion {
    CGFloat percentage = _elapsedTime/_duration;
    if(percentage >= 1) {
        return 1.0f;
    } else if(percentage <= 0) {
        return 0.0f;
    } else {
        return percentage;
    }
}

- (NSString *)timingFunction {
    return !_timingFunction ? _timingFunction = kCAMediaTimingFunctionEaseInEaseOut : _timingFunction;
}

#pragma mark Property Setters

- (void)setProgress:(CGFloat)progress {
    if(progress >= 1) {
        self.shapeLayer.strokeEnd = 1.0f;
    } else if(progress <= 0) {
        self.shapeLayer.strokeEnd = 0.0f;
    } else {
        self.shapeLayer.strokeEnd = progress;
    }
}


- (void)setTimerColor:(UIColor *)timerColor {
    if(![_timerColor isEqual:timerColor]) {
        _timerColor = timerColor;
        self.shapeLayer.strokeColor = timerColor.CGColor;
    }
}

- (void)setLineWidth:(CGFloat)lineWidth {
    if(_lineWidth != lineWidth) {
        _lineWidth = lineWidth;
        self.shapeLayer.lineWidth = lineWidth;
    }
}

@end
