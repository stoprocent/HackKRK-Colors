//
//  MSAppDelegate.m
//  HackKRKApril
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSCanvasRequest.h"

@interface MSAppDelegate () <MSCanvasRequestDelegate>

@end

@implementation MSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    MSCanvasRequest *request = [[MSCanvasRequest alloc] init];
    
    request.delegate = self;
    
    [request getNewChallenge];
}

- (void)gotNewChallengeWithColor:(NSColor *)color
                            size:(CGSize)size
                        serverId:(int)serverId
{
    NSLog(@"Color :%@, Size: %@, Server ID: %d", color, NSStringFromSize(size), serverId);
    self.window.backgroundColor = color;
}

@end
