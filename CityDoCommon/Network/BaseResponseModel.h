//
//  BaseResponseModel.h
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/21.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponseModel : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy)id data;

@end
