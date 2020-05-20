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
    
    
    UIButton *button = [UIButton cd_buttonWithFrame:CGRectMake(100, 100, 100, 100) image:nil title:@"2332" titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:12]];
    button.backgroundColor = UIColor.blueColor;
    [button useBezierPathClipCornerWithType:CDCornerRadiusTypeTopLeftToBottomRight WithCornerRadius:10];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view.
}

- (void)initUI {
    
}


@end
