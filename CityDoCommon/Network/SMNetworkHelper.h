//
//  SMNetworkHelper.h
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/21.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import "BaseResponseModel.h"

#define SMBaseURL @"https://api.smb.com/"

typedef void(^SMNetworkSuccessBlock)(id data);
typedef void(^SMNetworkFailBlock)(BaseResponseModel *resp);

@interface SMNetworkHelper : NSObject;


#pragma mark - 业务代码

+ (void)login:(NSDictionary *)params success:(SMNetworkSuccessBlock)success fail:(SMNetworkFailBlock)fail;

@end

