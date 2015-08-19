//
//  DetailViewController.h
//  NewTestProject
//
//  Created by 严若鹏 on 15/8/4.
//  Copyright (c) 2015年 严若鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>
#import "MyCodeView.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UIView *checkCodeNumberLabel;

- (BOOL)signInSignal;
@end

