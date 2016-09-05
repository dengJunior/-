//
//  UIView+Util.h
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)





@property (nonatomic, assign ) CGFloat x;//不能用 下划线， 可以set ,get.                       主要是因为 没有用  实例变量。                  相当于        是对  我们 写的两个方法的 合并。




@property (nonatomic, assign ) CGFloat y;



@property (nonatomic, assign ) CGFloat width;


@property (nonatomic, assign ) CGFloat height;

@property (nonatomic, assign ) CGSize size;

@property (nonatomic, assign ) CGFloat centerX;

@property (nonatomic, assign ) CGFloat centerY;




@end
