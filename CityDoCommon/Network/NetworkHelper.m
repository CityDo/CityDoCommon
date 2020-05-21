//
//  NetworkHelper.m
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/21.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import "NetworkHelper.h"
#import "CityDoNetWork.h"
#import "MJExtension.h"

@interface NetworkHelper()
@property (nonatomic, strong)CityDoNetWork *network;

@end
@implementation NetworkHelper

+ (instancetype)shareHelper {
    
    static dispatch_once_t onceToken;
    static NetworkHelper *helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[NetworkHelper alloc]init];
    });
    return helper;
}

- (instancetype)init {
    if (self = [super init]) {
        [self defaultConfig];
    }
    return self;
}

- (void)defaultConfig {
    self.network = [[CityDoNetWork alloc]init];
    self.network.timeoutInterval = 20.0;
    
    // 设置请求头 一般是通用参数
    self.network.headerHandler = ^NSDictionary *{
        
        NSMutableDictionary *headers = [NSMutableDictionary dictionary];
        [headers setValue:@"hdhgjkasdhsajfhdjsahj" forKey:@"token"];
        [headers setValue:[@([UIDevice currentDevice].systemVersion.doubleValue) stringValue] forKey:@"systemVersion"];
        return [headers copy];
    };
    
    // 请求预处理
    self.network.requestHandler = ^(AFHTTPSessionManager *manage) {
        // 设置编码
        manage.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    };
    
    // 返回结果预处理
    self.network.responseHandler = ^BOOL(id resp, NSError *err, CDSuccessBlock success, CDFailureBlock fail) {
        
        BaseResponseModel *model = [BaseResponseModel new];
        if (err) {
            
            model.code = err.code;
            switch (model.code) {
                case -1009:
                    model.msg = @"无网络连接，请检查网络";
                    break;
                default:
                    model.msg = @"服务器开小差了，请稍候再试";
                    break;
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

- (void)POST:(NSString *)path parameters:(id)parameters success:(SMNetworkSuccessBlock)success fail:(SMNetworkFailBlock)fail {
    [self.network POST:[NSString stringWithFormat:@"%@%@",SMBaseURL, path] params:parameters success:success failuer:^(NSError *error) {
        if (fail) {
            fail((BaseResponseModel *)error);
        }
    }];
}

#pragma mark - 业务代码

+ (void)login:(NSDictionary *)params success:(SMNetworkSuccessBlock)success fail:(SMNetworkFailBlock)fail {
    [[NetworkHelper shareHelper]POST:@"/login" parameters:params success:success fail:fail];
}

@end
