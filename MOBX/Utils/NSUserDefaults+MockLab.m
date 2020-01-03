//
//  NSUserDefaults+MockLab.m
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import "NSUserDefaults+MockLab.h"

#define KEY_JSESSION_COOKIE @"key_jsession_cookie"
#define KEY_INGRESS_COOKIE @"key_ingress_cookie"
#define KEY_BASE_URL @"key_base_url"

@implementation NSUserDefaults (MockLab)

+(void)setJSessionCookie:(NSString*)cookie{
    [self.standardUserDefaults setObject:cookie forKey:KEY_JSESSION_COOKIE];
}

+ (NSString *)getJSession {
    return [self.standardUserDefaults stringForKey:KEY_JSESSION_COOKIE];
}

+(void)setIngressCookie:(NSString*)cookie{
    [self.standardUserDefaults setObject:cookie forKey:KEY_INGRESS_COOKIE];
}

+ (NSString *)getIngress {
    return [self.standardUserDefaults stringForKey:KEY_INGRESS_COOKIE];
}

+ (void)setBaseURL:(NSString *)baseURL {
    [self.standardUserDefaults setObject:baseURL forKey:KEY_BASE_URL];
}

+ (NSString *)getBaseURL {
    NSString *url = [self.standardUserDefaults stringForKey:KEY_BASE_URL];
    return url == nil ? @"https://game.moblab.com/server/api" : url;
}

@end
