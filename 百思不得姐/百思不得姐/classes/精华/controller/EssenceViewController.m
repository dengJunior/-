//
//  EssenceViewController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceTableViewController.h"
#import "MenuModel.h"
#import "NavTitleView.h"
#import "NewsViewController.h"
@interface EssenceViewController () <UIPageViewControllerDataSource>


@property (nonatomic, strong ) UIPageViewController * pageVC;


@property (nonatomic, strong) NSArray * vcArray;




@end

@implementation EssenceViewController


- (NSArray *)vcArray{

    
    
    if (!_vcArray){
    
        
        EssenceTableViewController * recommendCtrl = [[EssenceTableViewController alloc ] init ];
        
        
//        EssenceTableViewController * videoCtrl = [[EssenceTableViewController alloc ] init ];
        UIViewController * videoCtrl = [[UIViewController alloc ] init ];
        videoCtrl.view.backgroundColor = [UIColor redColor ];
        
       
        
        
        
        
        
//        EssenceTableViewController * picCtrl = [[EssenceTableViewController alloc ] init ];
        UIViewController * picCtrl = [[UIViewController alloc ] init ];
        picCtrl.view.backgroundColor = [UIColor whiteColor ];
        
        
        
        
        
        
        _vcArray = @[recommendCtrl, videoCtrl, picCtrl];
        
    
    
    }






    return _vcArray;


}



//  subModel, 有什么用？
- (void)setSubModel:(SubMenuModel *)subModel{

    _subModel = subModel;
    
    NSMutableArray * titles = [NSMutableArray array ];
    
    for ( NavTitleModel * tModel in subModel.submenus ){
    
    
        [titles addObject: tModel.name ];
    
    
    
    }
    
    
    __weak typeof (self) weakSelf = self;
    
    dispatch_async( dispatch_get_main_queue()  , ^{
        
        
        NavTitleView * titleView = [[NavTitleView alloc ] initWithTitles:titles rightImageName:@"navigationButtonRandomN_26x26_" rightHighlightImageName:@"navigationButtonRandomClickN_26x26_"];
       
        [weakSelf.view addSubview: titleView ];
        
        
        
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.top.equalTo(weakSelf.view).offset(20);
            make.left.right.equalTo(weakSelf.view);
            make.height.mas_equalTo(44);
            
            
            
        }];
        
        
        
        
        
        
        
    });
    
    
    
    
    
    
    




}








- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:240.0/255.0 alpha:1.0 ];
    self.navigationController.navigationBarHidden = YES;
    
    UIPageViewController * pageVC = [[ UIPageViewController alloc  ] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil ]  ;
    pageVC.dataSource =self;
    
    EssenceTableViewController * recommendCtrl = [ self.vcArray  firstObject ];
    
   
    
    [pageVC setViewControllers: @[ recommendCtrl ] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion: nil ];
    
    
    [self.view addSubview: pageVC.view ];
    
    __weak typeof  (self) weakSelf = self ;
    [pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(64, 0, 49, 0));
        
        
        
        
    }];
    
    
    
    
    
    
    self.pageVC = pageVC;
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    
    
    //内存 泄漏 的时候， 会  调用这个方法    警告。
    
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Page Controller




- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{



    NSInteger curIndex = [self.vcArray indexOfObject: viewController ];
    
    
    if ( curIndex < self.vcArray.count -1 ){
    
        EssenceTableViewController * nextCtrl = self.vcArray[curIndex + 1];
        
        return nextCtrl;
    
    
    
    
    }
    
    return nil;

}





- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{



    NSInteger curIndex = [self.vcArray indexOfObject: viewController ];
    
    
    if ( curIndex > 0 ){
        
        EssenceTableViewController * preCtrl = self.vcArray[curIndex - 1];
        
        return preCtrl;
        
        
        
        
    }
    
    return nil;






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
