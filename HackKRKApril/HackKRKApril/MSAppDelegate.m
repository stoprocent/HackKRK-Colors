//
//  MSAppDelegate.m
//  HackKRKApril
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSCanvasRequest.h"

@implementation MSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    MSCanvasRequest *request = [[MSCanvasRequest alloc] init];
    [request getNewChallenge];
}

@end
