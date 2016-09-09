//
//  EssenceViewController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//
#import "EssenceViewController.h"

@interface EssenceViewController ()

@end

@implementation EssenceViewController








- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.rightImageName = @"navigationButtonRandomN_26x26_" ;
    self.rightSelectImageName = @"navigationButtonRandomClickN_26x26_";
    
    
    if (self.subModel){
    
    
        [self showData ];
    
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    
    
    //内存 泄漏 的时候， 会  调用这个方法    警告。
    
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
