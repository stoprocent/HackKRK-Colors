//
//  MSCanvasRequest.m
//  HackKRKApril
//
//  Created by Marek Serafin on 4/24/13.
//  Copyright (c) 2013 MS. All rights reserved.
//

static NSString *kApiTokenKey   = @"api_token";
static NSString *kApiToken      = @"synergize sexy action-items";
static NSString *kApiBaseUrl    = @"http://canvas.hackkrk.com/api/";

#import "MSCanvasRequest.h"
#import "AFNetworking.h"
#import "AFJSONRequestOperation.h"

@implementation MSCanvasRequest

- (id)init
{
    if(self = [super init])
    {
        
    }
    return self;
}

- (void)getNewChallenge
{
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL: [NSURL URLWithString: kApiBaseUrl]];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"new_challenge"
                                                      parameters:@{ kApiTokenKey: kApiToken }];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *color = [responseObject objectForKey:@"color"];
        float width    = [[responseObject objectForKey:@"answer_width"] floatValue];
        float height   = [[responseObject objectForKey:@"answer_height"] floatValue];
        int serverId   = [[responseObject objectForKey:@"id"] intValue];
        
        [self.delegate gotNewChallengeWithColor: [NSColor colorWithCalibratedRed: [[color objectAtIndex:0] floatValue] / 255.0
                                                                           green: [[color objectAtIndex:1] floatValue] / 255.0
                                                                            blue: [[color objectAtIndex:2] floatValue] / 255.0
                                                                           alpha:1.0]
                                           size: CGSizeMake(width, height)
                                       serverId: serverId];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [operation start];
}


@end
