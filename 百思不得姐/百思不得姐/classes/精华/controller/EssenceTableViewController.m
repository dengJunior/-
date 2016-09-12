//
//  EssenceTableViewController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/7.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "EssenceTableViewController.h"

#import "EssenceModel.h"

#import "EssenceVideoCell.h"
#import "EssenceTextCell.h"
#import "EssenceGifCell.h"
#import "EssenceImageCell.h"
#import "EssenceAudioCell.h"

@interface EssenceTableViewController ()  <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, assign) NSInteger lastTime ;


@property (nonatomic, strong) UITableView * tbView;


@property (nonatomic, strong) EssenceModel * dataModel;


@end

@implementation EssenceTableViewController




- (void) createTableView {
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.tbView = [[UITableView alloc ] initWithFrame:  CGRectZero  style:UITableViewStylePlain ];
    
    
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    
    
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self.view addSubview: self.tbView ];
    
    
    
    __weak typeof (self) weakSelf = self;
    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.edges.equalTo(weakSelf.view);
        
        
    } ];
    
    
    
    
    
    self.tbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFirstPage) ];
    
    
    
    
    self.tbView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore) ];
    
    
    
    
    
    
    
}




- (void) loadFirstPage{
    
    
    self.lastTime = 0;
    [self downloadData ];
    
    
    
}






- (void) loadMore{
    
    
    
    self.lastTime = self.dataModel.info.np;
    
    
    [self downloadData ];
    
    
    
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    
    
    [self createTableView ] ;
    
    [self downloadData ];
    
    
    
    
    
}



- (void) downloadData{
    
    
    NSMutableString * urlString = [NSMutableString stringWithString: self.urlPrefix ];
    
    [ urlString appendFormat: kEssenceSuffixURL, self.lastTime ];
    
    
    
    
    __weak typeof (self) weakSelf = self;
    
    
    NSLog(@"\n%@", urlString);
    //   http://s.budejie.com/topic/list/jingxuan/1/bs0315-iphone-4.3/0-20.json   视频

    
    [ BDJDownloader downloadWithUrlString:urlString finish:^(NSData *data) {
        
        
      
        NSError * error = nil;
        
        
        EssenceModel * model = [[EssenceModel alloc ] initWithData:data error: &error ];
        
        if (error){
            NSLog(@",  %@", error);
            
            
        }
        
        if (self.lastTime == 0){
            
            
            weakSelf.dataModel = model;
            
        }else {
            
            /*
             
             NSMutableArray * listArray = [NSMutableArray arrayWithArray: weakSelf.dataModel.list ];
             
             
             [listArray addObjectsFromArray: listArray ];
             
             
             model.list = (NSMutableArray < ListModel ,Optional>    *)  [NSArray arrayWithArray: listArray ];
             
             
             weakSelf.dataModel = model;
             
             */
            
            
            
            
            
            
            NSIndexSet * indexSet = [NSIndexSet indexSetWithIndexesInRange: NSMakeRange(0,  weakSelf.dataModel.list.count) ];
            
            [model.list insertObjects: weakSelf.dataModel.list atIndexes:indexSet ];
            
            
            weakSelf.dataModel = model;
            
            
        }
        
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [weakSelf.tbView reloadData ];
            
            
            [weakSelf.tbView.mj_footer endRefreshing ];
            
            
            [weakSelf.tbView.mj_header endRefreshing ];
            
            
        });
        
        
        
        
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error.description);
        
    } ];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataModel.list.count ;
    
    
}



- (UITableViewCell *) createVideoCellForTableView: (UITableView *) tableView atIndexPath: (NSIndexPath *)indexPath{
    
    
    
    static NSString * cellId = @"videoCellId";
    
    
    
    EssenceVideoCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    
    
    if (!cell){
        
        
        cell = [[[NSBundle mainBundle ] loadNibNamed: @"EssenceVideoCell"  owner:nil options:nil ] lastObject ];
        
    }
    
    
    ListModel * model = self.dataModel.list[indexPath.row];
    
    
    cell.model = model;
    
    return  cell;
    

    
    
    
    
    
}





- (UITableViewCell *) createImageCellForTableView: (UITableView *) tableView atIndexPath: (NSIndexPath *)indexPath{
    
    
//    NSString * cellId = @"imageCellId";
    static NSString * cellId = @"imageCellId";
    
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId ];
    
    EssenceImageCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId ];
    
    if (!cell){
    
    
    
        cell = [[[NSBundle mainBundle ] loadNibNamed: @"EssenceImageCell" owner:nil  options: nil ] lastObject ];
    
    }
    
    
    return cell;
    
    
}


- (UITableViewCell *) createAudioCellForTableView: (UITableView *) tableView atIndexPath: (NSIndexPath *)indexPath{
    
    
    static NSString * cellId = @"audioCellId";
    
    
    
    EssenceAudioCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    
    
    if (!cell){
        
        
        cell = [[[NSBundle mainBundle ] loadNibNamed: @"EssenceAudioCell"  owner:nil options:nil ] lastObject ];
        
    }
    
    
    ListModel * model = self.dataModel.list[indexPath.row];
    
    
    cell.model = model;
    
    return  cell;
    
    
    
}



- (UITableViewCell *) createTextCellForTableView: (UITableView *) tableView atIndexPath: (NSIndexPath *)indexPath{
    
    
    static NSString * cellId = @"textCellId";
    
    EssenceTextCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId ];
    
    if (nil == cell ){
    
        cell = [[[NSBundle mainBundle ] loadNibNamed:  @"EssenceTextCell"   owner:nil options:nil ]  lastObject ];
    
    
    }
    
    ListModel * model = self.dataModel.list[indexPath.row ];
    
    
    cell.model = model;
    
    
    return cell;
    
    
    
    
}


- (UITableViewCell *) createGifCellForTableView: (UITableView *) tableView atIndexPath: (NSIndexPath *)indexPath{
    
    
    static NSString * cellId = @"gifCellId";
    
    EssenceGifCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId ];
    
    if (nil == cell ){
        
        cell = [[[NSBundle mainBundle ] loadNibNamed:  @"EssenceGifCell"   owner:nil options:nil ]  lastObject ];
        
        
    }
    
    ListModel * model = self.dataModel.list[indexPath.row ];
    
    
    cell.model = model;
    
    
    return cell;
    
}



- (UITableViewCell *) createHtmlCellForTableView: (UITableView *) tableView atIndexPath: (NSIndexPath *)indexPath{
    
    
    return [[UITableViewCell alloc ] init ];
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cell = nil;
    
    ListModel * model = self.dataModel.list[indexPath.row];
    
    if ( [model.type isEqualToString: @"video"]  ){
    
        
        
        cell = [self createVideoCellForTableView:tableView atIndexPath:indexPath ];
    
    
    
    
    }else if ( [model.type isEqualToString: @"image"] ){
    
        cell = [self createImageCellForTableView:tableView atIndexPath:indexPath ];
    
        
    
    
    } else if ( [model.type isEqualToString: @"audio"] ){
        
        cell = [self createAudioCellForTableView:tableView atIndexPath:indexPath ];
        
        
        
        
    }  else if ( [model.type isEqualToString: @"text"] ){
        
        cell = [self createTextCellForTableView:tableView atIndexPath:indexPath ];
        
        
        
        
    }  else if ( [model.type isEqualToString: @"gif"] ){
        
        cell = [self createGifCellForTableView:tableView atIndexPath:indexPath ];
        
        
        
        
    }  else if ( [model.type isEqualToString: @"html"] ){
        
        cell = [self createHtmlCellForTableView:tableView atIndexPath:indexPath ];
        
        
        
        
    }else {
    
    
        cell = [[UITableViewCell alloc ] init ];
    
    
    }
    
    
    
    return cell;
}







- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ListModel * model = self.dataModel.list[indexPath.row];
    
    NSLog(@"%s", __func__);
    
    //NSLog(@"%lf", model.cellHeight.floatValue);
    return  model.cellHeight.floatValue ;
    
    
}




- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 600;
}

@end
