//
//  Rest+Auth.m
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import "Rest+Auth.h"

#define versionUrl @"https://test.moblab.com/server/api/events/system"
#define logonUrl @"https://test.moblab.com/server/api/users/logon"

@implementation Rest (Auth)

+(void)getVersion:(DataBlock)callback onError:(ErrorHandler)errorHandler{
    
    [self basicRequest:versionUrl bodyString:nil method:@"GET" onComplete:^(id  _Nonnull data) {
        callback(data);
    } onError:^(NSError * _Nonnull err) {
        errorHandler(err);
    }];
}

@end
