//
//  NSUserDefaults+MockLab.h
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (MockLab)
+(void)setJSessionCookie:(NSString*)cookie;
+(NSString*)getJSession;
+(void)setIngressCookie:(NSString*)cookie;
+(NSString*)getIngress;
+(void)setBaseURL:(NSString*)baseURL;
+(NSString*)getBaseURL;
@end

NS_ASSUME_NONNULL_END
