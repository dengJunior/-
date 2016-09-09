//
//  NewsViewController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "NewsViewController.h"


@interface NewsViewController ()
@end

@implementation NewsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rightImageName = @"review_post_nav_iconN_20x17_";
    
    self.rightSelectImageName = @"review_post_nav_icon_clickN_20x17_";
    
    if (self.subModel) {
    
    
        [self showData ];
    
    }
    
    
    
    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
