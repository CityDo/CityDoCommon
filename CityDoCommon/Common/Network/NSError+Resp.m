//
//  NSError+Resp.m
//  SuperMarketBusiness
//
//  Created by volientDuan on 2020/6/1.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import "NSError+Resp.h"
#import <objc/runtime.h>

@implementation NSError (Resp)

char *RespObjectSafeKey = "RespObjectSafeKey";

- (id)respObject {
    return objc_getAssociatedObject(self, RespObjectSafeKey);
}

- (void)setRespObject:(id)respObject {
    if (self.respObject != respObject) {
        [self willChangeValueForKey:@"respObject"];
        objc_setAssociatedObject(self, RespObjectSafeKey, respObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"respObject"];
    }
}


@end
