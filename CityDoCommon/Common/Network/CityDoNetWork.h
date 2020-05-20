//
//  CityDoNetWork.h
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/19.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager+CityDoNetWork.h"

typedef void(^CDSuccessBlock)(id JSON);
typedef void(^CDFailureBlock)(NSError *error);

@interface CityDoNetWork : NSObject
@property (nonatomic, assign)NSTimeInterval timeoutInterval;
@property (nonatomic, copy)NSDictionary * (^headerHandler)(void);
@property (nonatomic, copy)void (^requestHandler)(AFHTTPSessionManager *manage);
@property (nonatomic, copy)id (^responseHandler)(id resp, NSError *err);

+ (CityDoNetWork *)shareInstance;

/// 请求通用方法
/// @param url 请求URL
/// @param method 请求方法
/// @param type 参数传递方式
/// @param parameters 参数
/// @param uploadProgress 上传进度回调
/// @param success 成功回调
/// @param failure 失败回调
- (NSURLSessionDataTask *)request:(NSString *)url
                           method:(CDMethod)method
                             type:(CDParamsType)type
                       parameters:(id)parameters
                   uploadProgress:(void (^)(NSProgress *uploadProgress))uploadProgress
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;


- (void)GET:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

- (void)POST:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

- (void)PUT:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

- (void)DELETE:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

- (void)POST_JSON:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

- (void)PUT_JSON:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

- (void)DELETE_JSON:(NSString *)path params:(id)params success:(CDSuccessBlock)success failuer:(CDFailureBlock)fail;

/// 自建证书
- (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;

@end
