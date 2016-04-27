//
//  ViewController.m
//  ChangeFont
//
//  Created by HenryCheng on 16/4/27.
//  Copyright © 2016年 HenryCheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    for(NSString *familyName in [UIFont familyNames]){
//        NSLog(@"Font FamilyName = %@",familyName); //输出字体族科名字
//
//        for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
//            NSLog(@"\t%@",fontName);         //输出字体族科下字样名字
//        }
//    }
    
//    _myLabel.font = [UIFont fontWithName:@"FZLBJW--GB1-0" size:17.0f];
//    _myButton.titleLabel.font = [UIFont fontWithName:@"FZLBJW--GB1-0" size:17.0f];
//    _myLabel.tag = 10086;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
