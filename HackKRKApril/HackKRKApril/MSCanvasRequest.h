//
//  MSCanvasRequest.h
//  HackKRKApril
//
//  Created by Marek Serafin on 4/24/13.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSCanvasRequestDelegate <NSObject>

- (void)gotNewChallengeWithColor:(NSColor*)color
                            size:(CGSize)size
                        serverId:(int)serverId;

@end

@interface MSCanvasRequest : NSObject

@property (nonatomic, assign) id <MSCanvasRequestDelegate>delegate;

- (void)getNewChallenge;

@end
