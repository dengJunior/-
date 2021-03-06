//
//  EssenceModel.h
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@class InfoModel;
@class UserModel;
@class VideoModel;
@class CommentModel;
@class ImageModel;
@class GifModel;
@class AudioModel;
@protocol ListModel;
@protocol TagModel;
@protocol NSString;
@protocol CommentModel;




@interface EssenceModel : JSONModel
@property (nonatomic, strong) InfoModel<Optional> * info;
@property (nonatomic, strong) NSMutableArray<ListModel,Optional> * list;
@end




@interface InfoModel : JSONModel
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger np;
@end



@interface ListModel : JSONModel


@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString<Optional> * comment;


@property (nonatomic, strong) NSArray<Optional, CommentModel> * top_comments;




@property (nonatomic, strong) CommentModel<Optional> * top_comment;


@property (nonatomic, strong) NSArray<Optional,TagModel> * tags;

@property (nonatomic, strong) NSString<Optional> * bookmark;
@property (nonatomic, strong) NSString<Optional> * text;
@property (nonatomic, strong) NSString<Optional> * up;



@property (nonatomic, strong) NSString<Optional> * share_url;
@property (nonatomic, assign) NSInteger down;
@property (nonatomic, assign) NSInteger forward;



@property (nonatomic, strong) UserModel<Optional> * u;
@property (nonatomic, strong) NSString<Optional> * passtime;
@property (nonatomic, strong) VideoModel<Optional> * video;


@property (nonatomic, strong) NSString<Optional> * type;
@property (nonatomic, strong) NSString<Optional> * listId;




@property (nonatomic, strong) NSNumber<Optional> * cellHeight;



@property (nonatomic, strong) ImageModel<Optional> * image ;
@property (nonatomic, strong) GifModel<Optional> * gif ;
@property (nonatomic, strong) AudioModel<Optional> * audio;


@end














@interface CommentModel : JSONModel

@property (nonatomic, assign) NSInteger voicetime;
@property (nonatomic, assign) NSInteger precid;
@property (nonatomic, strong) NSString<Optional> * content;


@property (nonatomic, assign) NSInteger like_count;
@property (nonatomic, strong) UserModel<Optional> *u;
@property (nonatomic, assign) NSInteger preuid;

@property (nonatomic, assign) NSInteger commentId;
@property (nonatomic, strong) NSString<Optional> * passtime;
@property (nonatomic, assign) NSInteger voiceuri;     //   不是  voiceurl


@end






@interface TagModel : JSONModel
@property (nonatomic, assign) NSInteger tagId;
@property (nonatomic, strong) NSString<Optional> * name;

@end




@interface UserModel : JSONModel

@property (nonatomic, strong) NSArray<Optional, NSString> * header;
//@property (nonatomic, assign) BOOL is_v;
@property (nonatomic, strong) NSNumber<Optional> * is_v;

@property (nonatomic, strong) NSString<Optional> * uid;

//@property (nonatomic, assign) BOOL is_vip;
@property (nonatomic, strong) NSNumber<Optional> * is_vip;


@property (nonatomic, strong) NSString<Optional> * name;


@property (nonatomic, strong) NSString<Optional> * sex;

@end




@interface ImageModel : JSONModel


@property (nonatomic, strong) NSArray<Optional, NSString> * medium;
@property (nonatomic, strong) NSArray<Optional, NSString> * big;
@property (nonatomic, strong) NSArray<Optional, NSString> * download_url;


@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, strong) NSArray<Optional, NSString> * small;


@property (nonatomic, strong) NSArray<Optional, NSString> * thumbnail_small;



@end




@interface AudioModel : JSONModel


@property (nonatomic, assign) NSInteger playfcount;
@property (nonatomic, strong) NSArray<Optional, NSString> * download_url;
@property (nonatomic, assign) NSInteger height;


@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, assign) NSInteger playcount;



@property (nonatomic, strong) NSArray<Optional, NSString> * audio;
@property (nonatomic, strong) NSArray<Optional, NSString> * thumbnail;
@property (nonatomic, strong) NSArray<Optional, NSString> * thumbnail_small;



@end



@interface GifModel : JSONModel


@property (nonatomic, strong) NSArray<Optional, NSString> * images;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, strong) NSArray<Optional, NSString> * gif_thumbnail;


@property (nonatomic, strong) NSArray<Optional, NSString> * download_url;
@property (nonatomic, assign) NSInteger height;


@end




@interface VideoModel : JSONModel


@property (nonatomic, assign) NSInteger playfcount;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;

@property (nonatomic, strong) NSArray<Optional, NSString> * video;
@property (nonatomic, strong) NSArray<Optional, NSString> * download;
@property (nonatomic, assign) NSInteger duration;


@property (nonatomic, assign) NSInteger playcount;
@property (nonatomic, strong) NSArray<Optional, NSString> * thumbnail;
@property (nonatomic, strong) NSArray<Optional, NSString> * thumbnail_small;


@end

