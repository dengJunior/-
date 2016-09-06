//
//  EssenceVideoCell.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/6.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "EssenceVideoCell.h"
#import "EssenceModel.h"


@interface EssenceVideoCell()


@property (weak, nonatomic) IBOutlet UIImageView *userImageView;



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;



@property (weak, nonatomic) IBOutlet UILabel *descLabel;



@property (weak, nonatomic) IBOutlet UILabel *contentLabel;




@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;




@property (weak, nonatomic) IBOutlet UILabel *playNumLabel;




@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;


@property (weak, nonatomic) IBOutlet UILabel *commentLabel;




@property (weak, nonatomic) IBOutlet UIImageView *tagImageView;



@property (weak, nonatomic) IBOutlet UILabel *tagLabel;




@property (weak, nonatomic) IBOutlet UIButton *loveButton;




@property (weak, nonatomic) IBOutlet UIButton *hateButton;



@property (weak, nonatomic) IBOutlet UIButton *shareButton;




@property (weak, nonatomic) IBOutlet UIButton *commentButton;






@end



@implementation EssenceVideoCell




- (IBAction)favouriteAction:(id)sender {
}








- (IBAction)videoPlayAction:(id)sender {
}





- (IBAction)loveAction:(id)sender {
}





- (IBAction)hateAction:(id)sender {
}




- (IBAction)shareAction:(id)sender {
}





- (IBAction)commentAction:(id)sender {
}




- (void) setModel: (ListModel *) model {


    _model = model;
    
    
    NSString * userImageName = [model.u.header firstObject ];
    
    

    [self.userImageView sd_setImageWithURL: [ NSURL URLWithString:  userImageName   ] ];
    
    
    
    self.userImageView.layer.cornerRadius = 15;
    self.userImageView.layer.masksToBounds = YES;
    
    
    
    
    
   
    self.nameLabel.text = model.u.name;
    
    
    self.descLabel.text = model.passtime;
    
    
    
    self.contentLabel.text = model.text;
    
    
    
    
    
    NSString * picName = [model.video.thumbnail_small firstObject ];
    
    
    [self.videoImageView sd_setImageWithURL:[ NSURL URLWithString: picName  ]];
    
    
    
    self.playNumLabel.text = [ NSString stringWithFormat: @"%ld播放" ,  model.video.playcount ];
    
    
    
    
    NSMutableString * timeStr = [NSMutableString string ];
    
    
    NSInteger duration = model.video.duration ;
    
    
    if (duration > 3600) {
    
    
    
        [ timeStr appendFormat: @"%02ld:" , duration/3600  ] ;
    
        
        
        duration = duration % 3600 ;
    
    
    }
    
    
    
    
    if ( duration > 60 ){
    
    
        [timeStr appendFormat:@"%02ld:", duration / 60  ];
    
    
        
        duration = duration % 60;
    
    
    
    
    
    }
    
    
    
    
    
      [timeStr appendFormat: @"%2ld:", duration ];
    
    
    
    
    /*
    if (model.video.duration > 3600) {
    
    
        [timeStr appendFormat: @"%2ld:", model.video.duration/3600 ];
        
        
        
    
    }
    
    if (model.video.duration > 60 ) {
    
        NSInteger minuteNum = model.video.duration ;
        
        if (minuteNum > 3600){
        
        
        
        
            minuteNum = minuteNum % 3600;
        
        
        }
        
        
        [timeStr appendFormat: @"%02ld: ", minuteNum/60 ];
    
    
    
    
    
    }
    
    */
    
    
    
    
//    model.top_comments
    
    

    self.playTimeLabel.text = timeStr;
    
    
    
    
    NSString * commentStr = [ NSString stringWithFormat: @"%@: %@", model.top_comment.u.name, model.top_comment.content ];
    self.commentLabel.text = commentStr;


    
    
    
    NSMutableString * tagStr = [NSMutableString string ];
    
    
    for ( TagModel * tag in model.tags  ){
    
    
        [ tagStr appendFormat: @"%@, ", tag.name ];
        
        
    
    }
    
    self.tagLabel.text = tagStr;
    [self.loveButton setTitle: model.up  forState:UIControlStateNormal ];
    [self.loveButton setTitle: model.up  forState:UIControlStateSelected ];
    
    
    
    [self.hateButton setTitle: [ NSString stringWithFormat: @"%ld", model.down ] forState:UIControlStateNormal ];
    [self.hateButton setTitle: [ NSString stringWithFormat: @"%ld", model.down ] forState:UIControlStateSelected ];
    
    [self.shareButton setTitle:[NSString stringWithFormat: @"%ld", model.forward  ] forState:UIControlStateNormal ];
    [self.shareButton setTitle:[ NSString stringWithFormat:@"%ld" , model.forward ] forState:UIControlStateSelected ];
    
    [self.commentButton setTitle: model.comment  forState:UIControlStateNormal ];
    [self.commentButton setTitle: model.comment  forState:UIControlStateSelected ];
    
    
}











- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
