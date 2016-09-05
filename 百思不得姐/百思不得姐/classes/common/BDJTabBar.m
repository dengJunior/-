//
//  BDJTabBar.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "BDJTabBar.h"
#import "UIButton+Util.h"




@implementation BDJTabBar




- (instancetype)init {


    if ( self = [super init] ) {
    
    
//        self.barTintColor = [UIColor redColor ];
    
    
        
        UIButton * btn = [ UIButton createBtnTitle:nil withImageName:@"tabBar_publish_icon" withSelectedImageName:@"tabBar_publish_click_icon" withHighlightedImageName:@"tabBar_publish_click_icon" target:self  acton:@selector(publishAction)  ];
        
        
        
        [self addSubview: btn ];
        
        
    
    
    }







    return self;








}








- (void) publishAction {}








- (void)layoutSubviews {


    [super layoutSubviews];
    
    //重新 setFrame 之后， 调用。
    // Frame／约束    最后一次 修改后， 调用 显示 。
    
    
    CGFloat btnW = kScreenWidth/5;
    
    
    __block int index = 0;  // __block ,不然他 释放。  不加 ，就是个 临时变量
    
    
    for (UIView * subView in self.subviews ) {
        
        if ( [subView isKindOfClass:[ UIControl class ]  ]){
            
            
        
                
                if ([subView isKindOfClass:[ UIButton class] ]) {
                    
                
                    
                    CGFloat offsetX = (kScreenWidth-40.0)/2;
                    
                    
                    
                    
                    subView.frame = CGRectMake(offsetX , 4 , 40, 40);
                //   x+5,     随机值，      不能解决 屏幕 适配 的问题。
                    
                    
                    
                }else{
                    //index  跟打印的 没关系。 反正看不到 源代码。    根据 业务逻辑来。
                    
                    
                    
                    
                    if (index > 1){
                        
                        
                        subView.x = btnW * (index + 1);
                        
                        
                        
                    }else {
                        
                        subView.x = btnW * index;
                        
                      
                        
                        
                    }
                    
                    subView.width = btnW;
                
                    
                    index ++ ;
                    
                }
                
            
            
        }
        
    }


}





@end
