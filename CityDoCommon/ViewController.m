//
//  ViewController.m
//  CityDoCommon
//
//  Created by volientDuan on 2020/5/15.
//  Copyright © 2020 CityDo. All rights reserved.
//

#import "ViewController.h"
#import "CityDoCommon.h"

#import "NetworkHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"ABCdefjhijklmnopqrstuvwxyz";
    NSLog(@"%@==%@",str,[str cd_stringToLower]);
    
    [NetworkHelper login:@{} success:^(id data) {

    } fail:^(BaseResponseModel *resp) {

    }];
    
    UIButton *button = [UIButton cd_buttonWithFrame:CGRectMake(100, 100, 100, 100) image:nil title:@"2332" titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:12]];
    button.backgroundColor = UIColor.blueColor;
    [button cd_touchUpInsideEvent:^(UIControl *sender) {
        NSLog(@"eee");
    }];
    
    [button cd_singleTap:^(UITapGestureRecognizer *tap) {
        NSLog(@"ddaa");
    }];
    
    NSLog(@"%@",[CityDoCommonEncryptTool cd_encryptMobile:@"19211093233"]);
    
//    [button useBezierPathClipCornerWithType:CDCornerRadiusTypeTopLeftToBottomRight WithCornerRadius:10];
//    [self.view addSubview:button];
//
//    NSLog(@"%F",[CityDoAppTool calculateCacheSize]);
//    [CityDoAppTool clearAllCacheEndClearBlock:^(BOOL isSuccess) {
//        NSLog(@"%d",isSuccess);
//        NSLog(@"%f",[CityDoAppTool calculateCacheSize]);
//    }];
    
    NSLog(@"%@",[CityDoCommonEncryptTool cd_encryptString:@"1234" encryStr:@"❤" range:NSMakeRange(2, 2)]);
    
    // Do any additional setup after loading the view.
}

- (void)initUI {
    
}


@end
