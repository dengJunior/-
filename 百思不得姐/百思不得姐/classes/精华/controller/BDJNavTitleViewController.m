//
//  BDJNavTitleViewController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/8.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "BDJNavTitleViewController.h"
#import "EssenceTableViewController.h"
#import "MenuModel.h"
#import "NavTitleView.h"





@interface BDJNavTitleViewController ()    <  UIPageViewControllerDelegate,  UIPageViewControllerDataSource, NavTitleViewDelegate>


@property (nonatomic, strong ) UIPageViewController * pageVC;


@property (nonatomic, strong) NSArray * vcArray;

@property (nonatomic, strong) NavTitleView * titleView;



@end

@implementation BDJNavTitleViewController



- (void)loadView{

    [super loadView ];
    

    self.viewShowed = YES;

}








- (NSArray *)vcArray{
    
    
    
    if (!_vcArray){
        
        
        NSMutableArray * array = [NSMutableArray array ];
        
        
        for ( int i = 0; i < self.subModel.submenus.count; i++ ){
            
            
            EssenceTableViewController * essenceSubCtrl = [[EssenceTableViewController alloc ] init ];
            
            
            
            NavTitleModel * model = self.subModel.submenus[i];
            
            if ([model.url hasSuffix:@"/"] ){
                
                essenceSubCtrl.urlPrefix = model.url;
                
                
                
                
                
                
            }else {
                
                
                essenceSubCtrl.urlPrefix = [ NSString stringWithFormat: @"%@/", model.url ];
                
                
                
                
            }
            
            
            
            
            
            [array addObject: essenceSubCtrl ];
            
            
            
            
        }
        
        
        _vcArray = [NSArray arrayWithArray: array ];
    }
    
    
    
    
    
    
    return _vcArray;
    
    
}




- (void) showData {



    __weak typeof (self) weakSelf = self;
    
    dispatch_async( dispatch_get_main_queue()  , ^{
        
        
        NavTitleView * titleView = [[NavTitleView alloc ] initWithTitles: self.subModel.submenus rightImageName: self.rightImageName rightHighlightImageName: self.rightSelectImageName ];
        
        [weakSelf.view addSubview: titleView ];
        
        weakSelf.titleView = titleView;
        titleView.delegate = self;
        
        
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.top.equalTo(weakSelf.view).offset(20);
            make.left.right.equalTo(weakSelf.view);
            make.height.mas_equalTo(44);
            
            
            
        }];
        
        
    });
    
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self createPageController];
    });
    
    
    
    
    
    
    

}











//  subModel, 有什么用？
- (void)setSubModel:(SubMenuModel *)subModel{
    
    _subModel = subModel;
    
    //    NSMutableArray * titles = [NSMutableArray array ];
    //
    //    for ( NavTitleModel * tModel in subModel.submenus ){
    //
    //
    //        [titles addObject: tModel.name ];
    //
    //
    //
    //    }
    
    
    if (self.viewShowed){
    
    
        [self showData ];
    
    }
    
    
    
    //[self createPageController];     一定要  回到   主线程。
    
    
}






- (void) createPageController{
    
    self.navigationController.navigationBarHidden = YES;
    
    UIPageViewController * pageVC = [[ UIPageViewController alloc  ] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil ]  ;
    pageVC.dataSource =self;
    pageVC.delegate = self;
    
    // 调用数组 之前， model 一定 赋值了。
    EssenceTableViewController * recommendCtrl = [ self.vcArray  firstObject ];
    
    
    
    [pageVC setViewControllers: @[ recommendCtrl ] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion: nil ];
    
    
    [self.view addSubview: pageVC.view ];
    
    __weak typeof  (self) weakSelf = self ;
    [pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(64, 0, 49, 0));
        
        
        
        
    }];
    
    
    
    
    
    
    self.pageVC = pageVC;
    
    
    
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:  240.0/255.0  alpha: 1.0 ];
    
    // Do any additional setup after loading the view.
}





- (void)didReceiveMemoryWarning {
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



#pragma mark - pageViewController



- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    
    UIViewController * vCtrl = [pageViewController.viewControllers lastObject ];
    
    
    
    NSInteger index = [self.vcArray indexOfObject: vCtrl ];
    
    
    self.titleView.selectedIndex = index;
    
    
}









#pragma mark - NavTitleView



- (void)didClickRightButton:(NavTitleView *)navTitleView{
    
    
    NSLog(@"%s",__func__);
    
}














- (void)navTitleView:(NavTitleView *)navTitleView didClickButtonAtIndex:(NSInteger)index withUrlString:(NSString *)urlString {
    
    
    
    
    UIViewController * toVCtrl = self.vcArray[index];
    
    
    UIViewController * curCtrl = [self.pageVC.viewControllers lastObject ];
    
    
    NSInteger lastIndex = [self.vcArray indexOfObject: curCtrl ];
    
    UIPageViewControllerNavigationDirection dir = UIPageViewControllerNavigationDirectionForward;
    
    // 会相等的
    if (index < lastIndex ){
        
        
        dir = UIPageViewControllerNavigationDirectionReverse;
        
        
        
        
        
    }
    
    
    
    
    
    
    [self.pageVC setViewControllers: @[toVCtrl]   direction:dir  animated:YES completion:nil ];
    
    
    
    
    
    NSLog(@"%s",__func__);
    
    
    
    
    
    
}














@end
