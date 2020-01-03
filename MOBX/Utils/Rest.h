//
//  Rest.h
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block)(void);
typedef void(^DataBlock)(id _Nonnull data);
typedef void(^ErrorHandler)(NSError * _Nonnull err);

@interface Rest : NSObject

+(void)basicRequest:(NSString*_Nonnull)urlString
         bodyString:(NSString*_Nullable)bodyString
             method:(NSString*_Nonnull)method
         onComplete:(DataBlock _Nonnull )callback
            onError:(ErrorHandler _Nonnull )errorHandler;
@end

