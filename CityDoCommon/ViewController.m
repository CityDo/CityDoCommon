//
//  ViewController.m
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/15.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import "ViewController.h"
#import "CityDoCommon.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"ABCdefjhijklmnopqrstuvwxyz";
    NSLog(@"%@==%@",str,[str cd_stringToLower]);
    [CityDoNetWork shareInstance].responseHandler = ^id(id resp, NSError *err) {
        return resp?:err;
    };
    [[CityDoNetWork shareInstance]request:@"https://supermarket.citydo.com.cn/gateway-app/open-api-applet/order/evaluation/saveOrderEvaluation" method:CDMethodGET type:CDParamsTypeQuery parameters:@{@"name":@"fghj"} uploadProgress:nil success:^(id responseObject) {

    } failure:^(NSError *error) {

    }];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    
}


@end
