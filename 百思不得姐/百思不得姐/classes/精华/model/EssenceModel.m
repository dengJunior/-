//
//  EssenceModel.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "EssenceModel.h"

@implementation EssenceModel
@end





@implementation InfoModel
@end




@implementation ListModel


+ (JSONKeyMapper *)keyMapper{

    return [[JSONKeyMapper alloc ] initWithDictionary: @{@"id":  @"listId"} ];



}





@end



@implementation CommentModel

+ (JSONKeyMapper *)keyMapper{


    return [[JSONKeyMapper alloc ] initWithDictionary:@{ @"id" : @"commentId" } ];
    
    


}


@end





@implementation TagModel


+ (JSONKeyMapper *)keyMapper{


    return [[JSONKeyMapper alloc ] initWithDictionary: @{@"id": @"tagId"}];


}




@end



@implementation GifModel


@end


@implementation ImageModel

@end




@implementation UserModel
@end


@implementation AudioModel

@end




@implementation VideoModel
@end