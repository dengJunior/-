//
//  NavTItleView.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/7.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "NavTitleView.h"
#import "UIButton+Util.h"

#import "MenuModel.h"


@interface NavTitleView ()

@property (nonatomic, strong) NSArray * titlesModels;



@property (nonatomic, strong) UIView * lineView ;


@property (nonatomic, strong) UIView * containerView;

@end







@implementation NavTitleView


- (instancetype)initWithTitles:(NSArray *)titleModels rightImageName:(NSString *)imageName rightHighlightImageName:(NSString *)highlightImageName {

    
    
    
    
    if (self = [super init]){
        
        
        if (titleModels.count > 0){
        
    
        self.titlesModels = titleModels;
        UIButton * rightBtn = [ UIButton createBtnTitle:nil withImageName:imageName withSelectedImageName:nil withHighlightedImageName:highlightImageName target:self acton:@selector(clickRight) ];
        
        
    
        [self addSubview:rightBtn ];
        __weak typeof (self) weakSelf = self ;
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(weakSelf).offset(8);
            make.right.equalTo(weakSelf).offset(-10);
            make.size.mas_equalTo(CGSizeMake(30, 30));//    不能是 equal      或者， 设置 一个 宏。
            
            
        }];
        
        
        
        
        
        UIScrollView * scrollView = [[UIScrollView alloc ] init ];
        scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview: scrollView ];
        
        
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.top.and.bottom.equalTo(weakSelf);
            
            
            make.left.equalTo(weakSelf).offset(20);
            
            
            make.right.equalTo(rightBtn.mas_left);
            
            
        } ];
        
        
        
        UIView * containerView = [[UIView alloc ] init ];
        
        
        [scrollView addSubview: containerView ];
        
        
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(scrollView);
            make.height.equalTo(scrollView);
            
            
        }];
        
        CGFloat width = self.btnWidth;
        CGFloat spaceX = self.btnSpaceX;
        
        UIView * lastView = nil;
        
        
        for (int i = 0; i < titleModels.count; i++){
        
            NavTitleModel * model = titleModels[i];
//            NSLog(@"===%@",model);
            NSString * title = model.name;
            UIButton * btn = [UIButton createBtnTitle:title withImageName:nil withSelectedImageName:nil withHighlightedImageName:nil target:self acton:@selector(clickTitle:) ];
            [btn setTitleColor:[ UIColor grayColor ] forState: UIControlStateNormal ];
            [btn setTitleColor:[ UIColor redColor ] forState: UIControlStateSelected ];

            btn.tag = 300 + i;
            [containerView addSubview: btn ];

            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.top.and.bottom.equalTo(containerView);
                make.width.mas_equalTo(width);
                if (i == 0){
                    make.left.equalTo(containerView);
                }else{
                    make.left.equalTo(lastView.mas_right).offset(spaceX);
                }
            }];

            lastView = btn;
        }
        
        
        
        
        [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(lastView.mas_right);
            
            
        } ];
        
        
        
        self.lineView = [[UIView alloc ] init ];
        
        self.lineView.backgroundColor = [UIColor redColor ];
        
        [containerView addSubview: self.lineView ];
        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(2);
            make.bottom.equalTo(containerView);
            
            
            
            
        }];
        
        
        
        
        self.containerView = containerView;// 初始化 赋值。   在这里 赋值， 也可以。
        
        }
        
        
    }


    return  self;

}



- (CGFloat) btnWidth{
    return 60;
}


- (CGFloat) btnSpaceX{
    return 20;
}







- (void) clickRight{



    [self.delegate didClickRightButton: self ];
 


}



- (void) setSelectedIndex:(NSInteger)selectedIndex{

    if (_selectedIndex != selectedIndex){

        UIButton * lastBtn = [ self.containerView viewWithTag: 300 + _selectedIndex ];
        
        
        lastBtn.selected = NO;
        
        
        
        
        
        UIButton * curBtn = [ self.containerView viewWithTag: 300 + selectedIndex ];
        
        
        curBtn.selected = YES;
        
        CGFloat btnW = self.btnWidth;
        CGFloat btnSpaceX = self.btnSpaceX;
        
        
    
        [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            
//            make.left.equalTo(curBtn); 不行滴
            
            CGFloat x = (btnW + btnSpaceX)* selectedIndex ;
            
            make.left.mas_equalTo(x);
            
            
        }];
    
        UIScrollView * scrollView = ( UIScrollView * ) self.containerView.superview;
        
        CGFloat offsetX = curBtn.centerX - scrollView.centerX ;
        
        
        if (offsetX < 0){
        
            offsetX = 0;
        
        
        }
        
        if (offsetX > scrollView.contentSize.width - scrollView.bounds.size.width){
        
            
            offsetX = scrollView.contentSize.width - scrollView.bounds.size.width;
        
        
        
        }
        
        
        scrollView.contentOffset = CGPointMake(offsetX, 0);
        
        
    }
    
    _selectedIndex = selectedIndex;
//    self.selectedIndex = selectedIndex;     死循环

}




- (void) clickTitle: (UIButton * ) currentBtn {

    NSInteger index = currentBtn.tag - 300;
    
    
    if  (self.selectedIndex != index  )  {
        self.selectedIndex = index;
        
        NavTitleModel * model = self.titlesModels[index];
        
        [ self.delegate navTitleView:self didClickButtonAtIndex:index withUrlString: model.url ];
    
    }
    
    
    
    
    
    
    
    
   
    
    



}






@end
