//
//  Network.m
//  CrazyWords
//
//  Created by Vik on 05.11.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import "Network.h"
#import "Session.h"

@interface Network () <NSURLSessionTaskDelegate, NSURLSessionDataDelegate>
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSURLSession *dataSession;
@property (strong, nonatomic) NSURLSessionTask *currentTask;
@property (strong, nonatomic) NSMutableData *currentData;
@end

@implementation Network

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.url = [NSURL URLWithString:@"http://ge.tt/api/1/files/1K4q8HR2/0/blob?download"];
        
        Session *session = [[Session alloc] init];
        session.dataSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                            delegate:nil
                                                       delegateQueue:[NSOperationQueue mainQueue]];
        self.dataSession = session;
        
        NSError *error;
        NSData *data = [[NSData alloc] initWithContentsOfURL:self.url];
        
        NSDictionary *dict = [NSDictionary dictionary];
        if (data) {
            dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

        }
        
        
        
        
    }
    return self;
}



@end
