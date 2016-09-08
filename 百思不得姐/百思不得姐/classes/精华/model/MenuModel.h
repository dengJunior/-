//
//  MenuModel.h
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/7.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class DefaultMenuModel;

@protocol SubMenuModel;

@protocol NavTitleModel ;




@interface MenuModel : JSONModel


@property (nonatomic, strong) NSArray<SubMenuModel,Optional> * menus ;

@property (nonatomic, strong) DefaultMenuModel<Optional> * default_menu;




@end






@interface SubMenuModel : JSONModel


@property (nonatomic, strong) NSString<Optional> * name ;



@property (nonatomic, strong) NSArray<NavTitleModel,Optional> * submenus ;





@end







@interface NavTitleModel : JSONModel


@property (nonatomic, strong) NSString<Optional> * url ;



@property (nonatomic, strong) NSString<Optional> * god_topic_type ;

@property (nonatomic, strong) NSString<Optional> * type ;



@property (nonatomic, strong) NSString<Optional> * entrytype ;

@property (nonatomic, strong) NSString<Optional> * name ;



@end


















@interface DefaultMenuModel : JSONModel


@property (nonatomic, strong) NSString<Optional> * offline_day_3 ;

@property (nonatomic, strong) NSString<Optional> * initial ;

@property (nonatomic, strong) NSString<Optional> * offline_day_7 ;






@end













