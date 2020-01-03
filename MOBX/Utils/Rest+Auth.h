//
//  Rest+Auth.h
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rest.h"

@interface Rest (Auth)
+(void)getVersion:(DataBlock)callback onError:(ErrorHandler)errorHandler;
@end

