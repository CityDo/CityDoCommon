//
//  NetWorkManager.h
//  LGHuiGuanJia
//
//  Created by CityDoWCY on 2020/5/22.
//  Copyright © 2020 CityDoWCY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponseModel.h"

/**
 单例
 */
#undef AS_SINGLETON
#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;
#undef DEF_SINGLETON

#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
    return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
    static dispatch_once_t once; \
    static __class * __singleton__; \
    dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
    return __singleton__; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t once; \
    static __class * __singleton__; \
    dispatch_once(&once, ^{ __singleton__ = [super allocWithZone:zone]; } ); \
    return __singleton__; \
}


#define CDBaseURL @"http://139.196.38.21:9000" // 测试

typedef void(^NetWorkManagerSuccessBlock)(id _Nonnull data);
typedef void(^NetWorkManagerFailBlock)(BaseResponseModel * _Nonnull resp);

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManager : NSObject

AS_SINGLETON(NetWorkManager)

#pragma mark - 业务代码
- (void)login:(NSDictionary *)params success:(NetWorkManagerSuccessBlock)success fail:(NetWorkManagerFailBlock)fail;

- (void)getHomeDataWithMenuType:(NSInteger)type success:(NetWorkManagerSuccessBlock)success fail:(NetWorkManagerFailBlock)fail;

@end

NS_ASSUME_NONNULL_END
