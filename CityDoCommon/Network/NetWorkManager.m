//
//  NetWorkManager.m
//  LGHuiGuanJia
//
//  Created by CityDoWCY on 2020/5/22.
//  Copyright © 2020 CityDoWCY. All rights reserved.
//

#import "NetWorkManager.h"
#import "CityDoNetWork.h"
#import "MJExtension.h"

@interface NetWorkManager ()

@property (nonatomic, strong) CityDoNetWork *networkTool;

@end

@implementation NetWorkManager

DEF_SINGLETON(NetWorkManager)

#pragma mark - 初始化
- (instancetype)init {
    if (self = [super init]) {
        [self defaultConfig];
    }
    return self;
}

- (void)defaultConfig {
    self.networkTool = [[CityDoNetWork alloc] init];
    self.networkTool.timeoutInterval = 20.0;
    
    // 设置请求头 一般是通用参数
    self.networkTool.headerHandler = ^NSDictionary *{
        
        NSMutableDictionary *headers = [NSMutableDictionary dictionary];
        [headers setValue:@"hdhgjkasdhsajfhdjsahj" forKey:@"token"];
        [headers setValue:[@([UIDevice currentDevice].systemVersion.doubleValue) stringValue] forKey:@"systemVersion"];
        return [headers copy];
    };
    
    // 请求预处理
    self.networkTool.requestHandler = ^(AFHTTPSessionManager *manage) {
        // 设置编码
        manage.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    };
    
    // 返回结果预处理
    self.networkTool.responseHandler = ^BOOL(id resp, NSError *err, CDSuccessBlock success, CDFailureBlock fail) {
        
        BaseResponseModel *model = [BaseResponseModel new];
        if (err) {
            if (err.respObject) {
                model = [BaseResponseModel mj_objectWithKeyValues:resp];
            } else {
                model.code = err.code;
                switch (model.code) {
                    case -1009:
                        model.msg = @"无网络连接，请检查网络";
                        break;
                    default:
                        model.msg = @"服务器开小差了，请稍候再试";
                        break;
                }
            }
            
            
        } else {
            
            model = [BaseResponseModel mj_objectWithKeyValues:resp];
            if (model.code == 101) {
                // 登录失效
                // 1. 清除token 2.去登录 。。。。
            }
        }
        
        if (model.code == 200) { // 请求成功
            if (success) {
                success(model.data);
            } else {
                return NO;
            }
        } else {
            if (fail) {
                fail((id)model);
            } else {
                return NO;
            }
        }
        
        return YES;
    };
}

#pragma mark - 网络请求基本方法
- (void)GET:(NSString *)path params:(id)params success:(NetWorkManagerSuccessBlock)success failuer:(NetWorkManagerFailBlock)fail {
    [self.networkTool GET:[NSString stringWithFormat:@"%@%@",CDBaseURL, path] params:params success:success failuer:^(NSError *error) {
        if (fail) {
            fail((BaseResponseModel *)error);
        }
    }];
}

- (void)POST:(NSString *)path params:(id)params success:(NetWorkManagerSuccessBlock)success failuer:(NetWorkManagerFailBlock)fail {
    [self.networkTool POST:[NSString stringWithFormat:@"%@%@",CDBaseURL, path] params:params success:success failuer:^(NSError *error) {
        if (fail) {
            fail((BaseResponseModel *)error);
        }
    }];
}

- (void)POST_JSON:(NSString *)path params:(id)params success:(NetWorkManagerSuccessBlock)success failuer:(NetWorkManagerFailBlock)fail {
    [self.networkTool POST_JSON:[NSString stringWithFormat:@"%@%@",CDBaseURL, path] params:params success:success failuer:^(NSError *error) {
        if (fail) {
            fail((BaseResponseModel *)error);
        }
    }];
}

#pragma mark - 网络请求
- (void)login:(NSDictionary *)params success:(NetWorkManagerSuccessBlock)success fail:(NetWorkManagerFailBlock)fail {
    [self POST:@"/login" params:params success:success failuer:fail];
}

@end
