//
//  MainTabBarController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "MainTabBarController.h"
#import "BDJTabBar.h"


@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    [UITabBar appearance].tintColor = [UIColor colorWithWhite:64.0/255.0 alpha:1.0 ];
    
  
    
    
    
    [self createViewControllers ];
    
    
    
    
    
    [self setValue:[[BDJTabBar alloc ] init ] forKey: @"tabBar" ];

    
    
    
    
}



- (void) addViewController: (NSString *) clsName  withTitle: (NSString *) title withImageName: (NSString *) imageName withSelectedImageName: (NSString *) selectedImageName {


    
    
    Class cls = NSClassFromString(clsName);
    
    UIViewController * ctrl = [[cls alloc ] init ];
    
    
    ctrl.tabBarItem.title = title;
    
    
    ctrl.tabBarItem.image = [UIImage imageNamed: imageName]  ;
    
    
    ctrl.tabBarItem.selectedImage = [ [UIImage imageNamed: selectedImageName ]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] ;
    
    UINavigationController * navCtrl = [[UINavigationController alloc ] initWithRootViewController: ctrl ];
    
    [self addChildViewController: navCtrl ];




}





- (void) createViewControllers {

    
    
    
    [self addViewController:@"EssenceViewController" withTitle:@"精华" withImageName:@"tabBar_essence_icon" withSelectedImageName:@"tabBar_essence_click_icon" ];
    
    
    
    
    
    
    
    
    
    
     [self addViewController:@"NewsViewController" withTitle:@"最新" withImageName:@"tabBar_new_icon" withSelectedImageName:@"tabBar_new_click_icon" ];
    
    
    
    
    
     [self addViewController:@"FollowViewController" withTitle:@"关注" withImageName:@"tabBar_friendTrends_icon" withSelectedImageName:@"tabBar_friendTrends_click_icon" ];
    
    
    
    
    
    
    
     [self addViewController:@"ProfileViewController" withTitle:@"我" withImageName:@"tabBar_me_icon" withSelectedImageName:@"tabBar_me_click_icon" ];
    
    
    
    
    
    
    
    
    
    
    
    
    
   




}
























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
