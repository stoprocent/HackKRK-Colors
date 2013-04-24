//
//  BaseLogoView.h
//  HackKRKApril
//
//  Created by Dominik Kapusta on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BaseLogoView : NSView

- (id)initWithFrame:(NSRect)frameRect color:(NSColor *)color;

- (NSImage *)imageRepresentation;

@end
