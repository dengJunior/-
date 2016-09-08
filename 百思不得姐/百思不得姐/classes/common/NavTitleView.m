//
//  NavTItleView.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/7.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "NavTitleView.h"
#import "UIButton+Util.h"
@implementation NavTitleView


- (instancetype)initWithTitles:(NSArray *)titles rightImageName:(NSString *)imageName rightHighlightImageName:(NSString *)highlightImageName {

    if (self = [super init]){
    
        
        UIButton * rightBtn = [ UIButton createBtnTitle:nil withImageName:imageName withSelectedImageName:nil withHighlightedImageName:highlightImageName target:self acton:@selector(clickRight) ];
        
        
    
        [self addSubview:rightBtn ];
        __weak typeof (self) weakSelf = self ;
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(weakSelf).offset(6);
            make.right.equalTo(weakSelf).offset(-20);
            make.size.mas_equalTo(CGSizeMake(40, 32));//    不能是 equal      或者， 设置 一个 宏。
            
            
        }];
        
        
        
        
        
        UIScrollView * scrollView = [[UIScrollView alloc ] init ];
        
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
        
        CGFloat width = 60;     //  40
        CGFloat spaceX = 20; //  30
        
        
        UIView * lastView = nil;
        
        
        for (int i = 0; i < titles.count; i++){
        
            
            NSString * title = titles[i];
            
            UIButton * btn = [UIButton createBtnTitle:title withImageName:nil withSelectedImageName:nil withHighlightedImageName:nil target:self acton:@selector(clickTitle) ];
            
            [containerView addSubview: btn ];
            
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.top.bottom.equalTo(containerView);
                
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
        
        
        
        
        
        
        
        
        
    }


    return  self;

}

- (void) clickTitle{}


- (void) clickRight{}



@end
