//
//  BDJNavTitleViewController.h
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/8.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "BaseViewController.h"
@class SubMenuModel;
@interface BDJNavTitleViewController : BaseViewController

@property (nonatomic, strong) SubMenuModel * subModel ;

@property (nonatomic, copy) NSString * rightImageName ;

@property (nonatomic, copy) NSString * rightSelectImageName;


@property (nonatomic, assign) BOOL viewShowed;

- (void) showData ;



@end
