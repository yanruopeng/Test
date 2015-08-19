//
//  DetailViewController.m
//  NewTestProject
//
//  Created by 严若鹏 on 15/8/4.
//  Copyright (c) 2015年 严若鹏. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    RACSignal *usernameSignal = [self.userName.rac_textSignal map:^id(NSString * value) {
        return @(value.length>=6);
    }];
    RACSignal *passwordSignal = [self.passWord.rac_textSignal map:^id(NSString * value) {
        return @(value.length>=6);
    }];
    
    RACSignal *signInActiveSignal = [RACSignal combineLatest:@[usernameSignal,passwordSignal] reduce:^id(NSNumber *usernameValid,NSNumber *passwordValid){
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }];
    
    [signInActiveSignal subscribeNext:^(NSNumber *signActive) {
        self.loginBtn.enabled = [signActive boolValue];
    }];
    
    [[[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id x) {
          self.loginBtn.enabled = NO;
      }]
     map:^id(id value) {
         return [NSNumber numberWithBool: [self signInSignal]];
     }]
    subscribeNext:^(NSNumber * x) {
        NSLog(@"%@",x);
        BOOL success = [x boolValue];
        if (success) {
            self.loginBtn.enabled = success;
            NSLog(@"login success!!!");

            if (_checkCodeNumberLabel) {
                //重新绘制验证码图形
                [_checkCodeNumberLabel setNeedsDisplay];
            }
            else
            {
                _checkCodeNumberLabel = [[MyCodeView alloc]init];
                
                [self.view addSubview:_checkCodeNumberLabel];
            }
        }
    }];
}
- (BOOL)signInSignal
{
    return [self.userName.text isEqualToString:@"username"] && [self.passWord.text isEqualToString:@"password"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
