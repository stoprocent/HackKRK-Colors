//
//  MSAppDelegate.m
//  HackKRKApril
//
//  Created by Michał Śmiałko on 24.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSCanvasRequest.h"
#import "BaseLogoView.h"

@interface MSAppDelegate () <MSCanvasRequestDelegate>

@property (nonatomic, strong) MSCanvasRequest *request;

@end

@implementation MSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    BaseLogoView *baseLogoView = [[BaseLogoView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)
                                                               color:[NSColor colorWithCalibratedRed:1.0 green:0.5 blue:0.0 alpha:1.0]];
    [self.window.contentView addSubview:baseLogoView];
    self.window.backgroundColor = [NSColor clearColor];

    // Insert code here to initialize your application
    self.request = [[MSCanvasRequest alloc] init];
    
    self.request.delegate = self;
    
    [self.request getNewChallenge];
}

- (void)postedImageSuccess
{
    [self.request getNewChallenge];
}

- (void)gotNewChallengeWithColor:(NSColor *)color
                            size:(CGSize)size
                        serverId:(int)serverId
{
    NSLog(@"Color :%@, Size: %@, Server ID: %d", color, NSStringFromSize(size), serverId);
    
    BaseLogoView *baseLogoView = [[BaseLogoView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)
                                                               color:color];
    
    [self.window.contentView addSubview:baseLogoView];
    
    self.window.backgroundColor = [NSColor clearColor];
    
    [self.request postChallengeWithImage: [baseLogoView imageRepresentation]
                             andServerId: serverId];
}

@end
