//
//  Rest.m
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import "Rest.h"
#import "NSUserDefaults+MockLab.h"

@implementation Rest

#pragma mark - Basic Request

+ (NSString *)getURLFor:(NSString *)path {
    return [NSString stringWithFormat:@"%@%@",NSUserDefaults.getBaseURL,path];
}

+(void)basicRequest:(NSString*)urlString
         bodyString:(NSString*)bodyString
             method:(NSString*)method
         onComplete:(DataBlock)callback
            onError:(ErrorHandler)errorHandler {
    NSMutableURLRequest *request = [self getBasicRequest:urlString bodyString:bodyString method:method];
    [self resumeSessionOnRequest:request onComlete:callback onError:errorHandler];
}

+(void)authRequest:(NSString*)urlString
         bodyString:(NSString*)bodyString
             method:(NSString*)method
         onComplete:(DataBlock)callback
            onError:(ErrorHandler)errorHandler {
    NSMutableURLRequest *request = [self getBasicRequest:urlString bodyString:bodyString method:method];
    [request addValue:[NSString stringWithFormat:@"INGRESSCOOKIE=%@;JSESSIONID=%@", NSUserDefaults.getIngress, NSUserDefaults.getJSession] forHTTPHeaderField:@"cookie"];
    [self resumeSessionOnRequest:request onComlete:callback onError:errorHandler];
}

+ (NSMutableURLRequest*)getBasicRequest:(NSString*)urlString
                             bodyString:(NSString*)bodyString
                                 method:(NSString*)method {
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setHTTPMethod:method];
    if (bodyString) {
        NSData *body = [bodyString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [request setHTTPBody:body];
    }
    return request;
}

+(void)resumeSessionOnRequest:(NSURLRequest*)request
                    onComlete:(DataBlock)callback
                      onError:(ErrorHandler)errorHandler{
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            errorHandler(error);
        } else {
            NSHTTPURLResponse *res = (NSHTTPURLResponse*)response;
            if (res.statusCode != 200) {
                NSError *err = [NSError errorWithDomain:NSURLErrorDomain code:res.statusCode userInfo:@{@"response":res}];
                errorHandler(err);
            } else {
                NSError *err; id json = nil;
                if (data != nil) {
                    json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
                    if (err) errorHandler(err);
                    if (callback) callback(json);
                }
            }
        }
    }]resume];
}


@end

