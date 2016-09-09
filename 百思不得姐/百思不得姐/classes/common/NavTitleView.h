//
//  NavTItleView.h
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/7.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NavTitleView;

@protocol NavTitleViewDelegate <NSObject>



- (void) navTitleView: (NavTitleView * ) navTitleView didClickButtonAtIndex: (NSInteger ) index withUrlString: (NSString * ) urlString;



- (void) didClickRightButton: (NavTitleView * ) navTitleView;







@end












@interface NavTitleView : UIView

- (instancetype) initWithTitles: (NSArray *) titleModels rightImageName: (NSString *) imageName  rightHighlightImageName: (NSString *) highlightImageName ;



@property (nonatomic, weak) id <NavTitleViewDelegate> delegate ;





@property (nonatomic, assign) NSInteger selectedIndex ;




@end
