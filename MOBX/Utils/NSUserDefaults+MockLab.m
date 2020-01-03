//
//  NSUserDefaults+MockLab.m
//  MOBX
//
//  Created by Chang Liu on 12/27/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import "NSUserDefaults+MockLab.h"

@implementation NSUserDefaults (MockLab)

+(void)setCookie:(NSString*)cookie{
    [NSUserDefaults.standardUserDefaults setObject:cookie forKey:@"key_cookie"];
}

@end
