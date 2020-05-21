//
//  ViewController.m
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/15.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import "ViewController.h"
#import "CityDoCommon.h"

#import "SMNetworkHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"ABCdefjhijklmnopqrstuvwxyz";
    NSLog(@"%@==%@",str,[str cd_stringToLower]);
    
    [SMNetworkHelper login:@{} success:^(id data) {

    } fail:^(BaseResponseModel *resp) {

    }];
    
    UIButton *button = [UIButton cd_buttonWithFrame:CGRectMake(100, 100, 100, 100) image:nil title:@"2332" titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:12]];
    button.backgroundColor = UIColor.blueColor;
    [button useBezierPathClipCornerWithType:CDCornerRadiusTypeTopLeftToBottomRight WithCornerRadius:10];
    [self.view addSubview:button];
    
    NSLog(@"%F",[CityDoAppTool calculateCacheSize]);
    [CityDoAppTool clearAllCacheEndClearBlock:^(BOOL isSuccess) {
        NSLog(@"%d",isSuccess);
        NSLog(@"%f",[CityDoAppTool calculateCacheSize]);
    }];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    
}


@end
