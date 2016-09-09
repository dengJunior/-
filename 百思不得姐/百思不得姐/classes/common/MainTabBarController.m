//
//  MainTabBarController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "MainTabBarController.h"
#import "BDJTabBar.h"
#import "MenuModel.h"

#import "EssenceViewController.h"
#import "NewsViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].tintColor = [UIColor colorWithWhite:64.0/255.0 alpha:1.0 ];
    [self createViewControllers ];
    [self setValue:[[BDJTabBar alloc ] init ] forKey: @"tabBar" ];
    
    
    [self downloadNavList ];
    
    
    BOOL flag = [[NSFileManager defaultManager ] fileExistsAtPath: [ self  navTitleFilePath ] ];
    
    
    if (flag) {
    
        NSData * data = [NSData dataWithContentsOfFile: [ self   navTitleFilePath ] ];
        
        
        [self parseData: data ];
    
    
    
    
    
    }
    
    [self downloadNavList ];
    
    
}



- (void) parseData: (NSData * ) data {

    
    __weak typeof (self) weakSelf = self;

    //万一 数组 是 空的， 要先 判断一下。
    MenuModel * model = [[MenuModel alloc ] initWithData:  data  error:  nil ];
    
    //不能 这样
    //        EssenceViewController * essenceCtrl = (EssenceViewController *) [weakSelf.viewControllers firstObject];
    //
    //        essenceCtrl.subModel = model.menus[0];
    
    
    UINavigationController * essenceNavigationCtrl = (UINavigationController *) [ weakSelf.viewControllers firstObject ];
    EssenceViewController * essenceControl = ( EssenceViewController * ) [ essenceNavigationCtrl.viewControllers firstObject ];
//    essenceControl.s
    
    essenceControl.subModel = model.menus[0];
    
    
    
    
    UINavigationController * newsNavigationCtrl = (UINavigationController *) weakSelf.viewControllers[1] ;
    //   (UINavigationController *) [ weakSelf.viewControllers firstObject ]
    
    NewsViewController * newsControl = (NewsViewController *) [newsNavigationCtrl.viewControllers firstObject];
    
    newsControl.subModel = model.menus[1];
    //model.menus[0]
    

}



- (NSString *) navTitleFilePath {

    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,  NSUserDomainMask , YES)  lastObject ];
    
    
    NSString * filePath = [docPath stringByAppendingPathComponent: @"navTitle" ];
    


    return filePath;


}








- (void) downloadNavList {

    __weak typeof (self) weakSelf = self;
    
    
    [ BDJDownloader downloadWithUrlString:kNavBarListUrl finish:^(NSData *data) {
        
        
        BOOL flag = [[NSFileManager defaultManager ] fileExistsAtPath: [ weakSelf  navTitleFilePath] ];
        
        
        if (!flag){
        
        
            [weakSelf parseData: data ];
        
        
        }
        
        [data writeToFile: [ self  navTitleFilePath  ] atomically: YES ];
        
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error.description);
    } ];










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



//“今天 又好了， 好奇怪。    完善了  pageViewController,   新增了 headView（ 一个scrollView）  ”
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



@end
