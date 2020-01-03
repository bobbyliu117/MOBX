//
//  Rest.h
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Block)(void);
typedef void(^DataBlock)(id data);
typedef void(^ErrorHandler)(NSError * err);

@interface Rest : NSObject

+(NSString*)getURLFor:(NSString*)path;

+(void)basicRequest:(NSString*)urlString
         bodyString:(NSString*_Nullable)bodyString
             method:(NSString*)method
         onComplete:(DataBlock)callback
            onError:(ErrorHandler)errorHandler;

+(void)authRequest:(NSString*)urlString
        bodyString:(NSString*_Nullable)bodyString
            method:(NSString*)method
        onComplete:(DataBlock _Nullable )callback
           onError:(ErrorHandler _Nullable )errorHandler;
@end

NS_ASSUME_NONNULL_END
