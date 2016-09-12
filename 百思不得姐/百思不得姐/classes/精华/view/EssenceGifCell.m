//
//  EssenceVideoCell.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/6.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "EssenceGifCell.h"
#import "EssenceModel.h"

@interface EssenceGifCell()

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@property (weak, nonatomic) IBOutlet UIView *commentView;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *tagImageView;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UIButton *loveButton;

@property (weak, nonatomic) IBOutlet UIButton *hateButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint * gifImageHCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewHCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewYCon;

@end



@implementation EssenceGifCell

- (void) setModel: (ListModel *) model {
    
    
    
    _model = model;
    NSString * userImageName = [model.u.header firstObject ];
    [self.userImageView sd_setImageWithURL: [ NSURL URLWithString:  userImageName   ] ];
    self.userImageView.layer.cornerRadius = 15;
    self.userImageView.layer.masksToBounds = YES;
   
    self.nameLabel.text = model.u.name;
    self.descLabel.text = model.passtime;
    self.contentLabel.text = model.text;
    
    
    
    NSString * picName = [model.gif.images firstObject ];
    
    //
    
    self.gifImageView.contentMode = UIViewContentModeTop;
    
    self.gifImageView.layer.masksToBounds = YES;
    
    
    
    
    //
    
    
    
    
    [self.gifImageView sd_setImageWithURL:[ NSURL URLWithString: picName  ]];

    
    CGFloat h = self.gifImageView.frame.size.width * model.gif.height / model.gif.width;
    
    
    if ( h > 300 ) {
        h = 300;
    }

 
    
    self.gifImageHCon.constant = h;
    
   
    if (!model.top_comment){
        
     
        self.commentView.hidden = YES;
    }else {
        self.commentView.hidden = NO;
        
        NSString * commentStr = [ NSString stringWithFormat: @"%@: %@", model.top_comment.u.name, model.top_comment.content ];
        
        self.commentLabel.text = commentStr;
    
    }
    
    
    
    
    
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
    
    [self layoutIfNeeded ];    //强制 cell 刷新，  也就是 按照数据， 全部显示 一次 cell.
   

    if (!model.top_comment){
    
    
        self.commentViewHCon.constant = 0;
        self.commentViewYCon.constant = 0;
    
    }else {
    
    
        self.commentViewHCon.constant = self.commentLabel.height + 8;
        self.commentViewYCon.constant = 14;
    
    
    
    
    }
    
    
    [self layoutIfNeeded ];
    
    
    
    
    NSLog(@"%lf", CGRectGetMaxY(self.loveButton.frame));
    model.cellHeight =  @(CGRectGetMaxY(self.loveButton.frame) + 10);   //加 @ , 转化为 对象。
    
    
}




- (IBAction)favouriteAction:(id)sender {
}











- (IBAction)loveAction:(id)sender {
}










- (IBAction)hateAction:(id)sender {
}






- (IBAction)shareAction:(id)sender {
}






- (IBAction)commentAction:(id)sender {
}







- (void)layoutSubviews {

    [super layoutSubviews ];
    
    
    if (!_model.comment ){
    
    
    
    
    
    
    
    
    
    
    
    
    
    }















}









- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
