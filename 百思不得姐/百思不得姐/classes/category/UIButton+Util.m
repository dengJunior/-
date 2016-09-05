//
//  UIButton+Util.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "UIButton+Util.h"

@implementation UIButton (Util)



+ (UIButton *)createBtnTitle:(NSString *)title withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName  withHighlightedImageName:(NSString *)highlightedImageName target:(id)target acton:(SEL)action {



    UIButton * btn = [UIButton  buttonWithType:UIButtonTypeCustom ];
    
    
    
    if (title != nil){
        [btn setTitle:  title  forState:UIControlStateNormal ];
        
        
        [btn setTitleColor:  [UIColor blackColor]   forState:UIControlStateNormal ];
    }




    if (imageName != nil ){
        [btn setBackgroundImage: [ UIImage imageNamed:imageName ]  forState:UIControlStateNormal ];
        
    }



    if (selectedImageName != nil ){
        [btn setBackgroundImage: [ UIImage imageNamed:selectedImageName ]  forState:UIControlStateSelected];
        
    }
    
    
    if (highlightedImageName != nil ){
        
        [btn setBackgroundImage: [ UIImage imageNamed:highlightedImageName ]  forState:UIControlStateHighlighted ];
        
        
    }

    
    
    
    if (target && action){
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside ];
    }


    return btn;
}







@end
