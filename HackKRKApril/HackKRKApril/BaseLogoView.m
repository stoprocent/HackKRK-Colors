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
    NSColor* color1 = [NSColor colorWithCalibratedRed:self.color.redComponent*1.15
                                                 green:self.color.greenComponent*1.15
                                                  blue:self.color.blueComponent*1.15
                                                 alpha:1.0];
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRect:NSMakeRect(15, 6, 35, 35)];
    [color1 setFill];
    [rectanglePath fill];
    
    // Rectangle
    NSColor* color2 = [NSColor colorWithCalibratedRed:self.color.redComponent*0.66
                                                green:self.color.greenComponent*0.66
                                                 blue:self.color.blueComponent*0.66
                                                alpha:0.6];

    NSBezierPath* rectangle2Path = [NSBezierPath bezierPathWithRect:NSMakeRect(15, 6, 18, 52)];
    [color2 setFill];
    [rectangle2Path fill];
}

- (NSImage *)imageRepresentation
{
    NSSize mySize = self.bounds.size;
    NSSize imgSize = NSMakeSize( mySize.width, mySize.height );
    
    NSBitmapImageRep *bir = [self bitmapImageRepForCachingDisplayInRect:[self bounds]];
    [bir setSize:imgSize];
    [self cacheDisplayInRect:[self bounds] toBitmapImageRep:bir];
    
    NSImage* image = [[NSImage alloc]initWithSize:imgSize];
    [image addRepresentation:bir];
    return image;
}
@end
