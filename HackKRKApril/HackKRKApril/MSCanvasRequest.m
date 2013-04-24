//
//  MSCanvasRequest.m
//  HackKRKApril
//
//  Created by Marek Serafin on 4/24/13.
//  Copyright (c) 2013 MS. All rights reserved.
//

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
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL: [NSURL URLWithString: @"http://canvas.hackkrk.com/api/new_challenge"]];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"" parameters:@{
        @"api_token": @"synergize sexy action-items"
     }];
    
    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [operation start];
}

@end
