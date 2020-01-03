
#import "Rest+Auth.h"
#import "NSUserDefaults+MockLab.h"

#define versionURL @"/events/system"
#define logonURL @"/users/logon"
#define userInfoURL(username) [NSString stringWithFormat:@"/users/%@",username]

@implementation Rest (Auth)

+(void)getVersion:(DataBlock)callback onError:(ErrorHandler)errorHandler{
    [self basicRequest:[self getURLFor:versionURL] bodyString:nil method:@"GET" onComplete:^(id  _Nonnull data) {
        callback(data);
    } onError:^(NSError * _Nonnull err) {
        errorHandler(err);
    }];
}

+(void)login:(NSString*)username password:(NSString*)password callback:(DataBlock)callback onError:(ErrorHandler)errorHandler{
    
    NSMutableCharacterSet *allowed = [NSMutableCharacterSet alphanumericCharacterSet];
    // previous exclude: @"!*'\"();:@&=+$,/?%#[]%"
    // password: #?!@$%^&*-
    [allowed addCharactersInString:@"-._~/?"];
    NSString *encodedUser = [username stringByAddingPercentEncodingWithAllowedCharacters:allowed];
    NSString *encodedPassword = [password stringByAddingPercentEncodingWithAllowedCharacters:allowed];
    
    NSString *bodyString = [NSString stringWithFormat:@"username=%@&password=%@", encodedUser, encodedPassword];
    [self basicRequest:[self getURLFor:logonURL] bodyString:bodyString method:@"PUT" onComplete:^(id  _Nonnull data) {
        [self updateJSessionIDAndIngressCookie];
        callback(data);
    } onError:^(NSError * _Nonnull err) {
        mobxLog(@"Error: %@",err.localizedDescription);
    }];
}

+(void)getUserInfo:(NSString*)username callback:(DataBlock)callback onError:(ErrorHandler)errorHandler{
    NSString *urlString = [self getURLFor:userInfoURL(username)];
    [self authRequest:urlString bodyString:nil method:@"GET" onComplete:^(id  _Nonnull data) {
        callback(data);
    } onError:^(NSError * _Nonnull err) {
        mobxLog(@"Error: %@",err.localizedDescription);
    }];
}

+(void)updateJSessionIDAndIngressCookie {
    for (NSHTTPCookie *cookie in NSHTTPCookieStorage.sharedHTTPCookieStorage.cookies) {
        if ([cookie.name isEqualToString:@"JSESSIONID"]) {
            [NSUserDefaults setJSessionCookie:cookie.value];
        } else if ([cookie.name isEqualToString:@"INGRESSCOOKIE"]) {
            [NSUserDefaults setIngressCookie:cookie.value];
        }
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}

@end
