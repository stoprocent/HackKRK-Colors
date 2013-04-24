//
//  BaseLogoView.m
//  HackKRKApril
//
//  Created by Dominik Kapusta on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "BaseLogoView.h"

@interface BaseLogoView ()
@property (nonatomic, strong) NSColor *color;
@end

@implementation BaseLogoView

- (id)initWithFrame:(NSRect)frameRect color:(NSColor *)color
{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.color = color;
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect
{
    NSBezierPath* backgroundPath = [NSBezierPath bezierPathWithRect:NSMakeRect(0, 0, 64, 64)];
    [self.color setFill];
    [backgroundPath fill];
    
    // Square
    NSColor* color1 = [NSColor colorWithCalibratedRed:self.color.redComponent*1.2
                                                 green:self.color.greenComponent*1.2
                                                  blue:self.color.blueComponent*1.2
                                                 alpha:1.0];
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect:NSMakeRect(15, 6, 35, 35)];
    [color1 setFill];
    [rectanglePath fill];
    
    // Rectangle
    NSColor* color2 = [NSColor colorWithCalibratedRed:self.color.redComponent*0.85
                                                green:self.color.greenComponent*0.85
                                                 blue:self.color.blueComponent*0.85
                                                alpha:0.6];
//    NSColor* color2 = [NSColor colorWithCalibratedHue:self.color.hueComponent*2
//                                           saturation:self.color.saturationComponent
//                                           brightness:self.color.brightnessComponent*1.5
//                                                alpha:0.6];
    color2 = [NSColor colorWithCalibratedRed:color2.redComponent*0.8
                                       green:color2.greenComponent*0.8
                                        blue:color2.blueComponent*0.8
                                       alpha:color2.alphaComponent];
    NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRect:NSMakeRect(15, 6, 18, 52)];
    [color2 setFill];
    [rectangle2Path fill];
}

@end
