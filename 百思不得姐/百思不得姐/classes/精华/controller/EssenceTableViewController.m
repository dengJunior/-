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
    
    
    NSString * urlString = [ NSString stringWithFormat: kEssenceVideoUrl  , self.lastTime ];
    
//    NSLog(@"%@",urlString);
    
    __weak typeof (self) weakSelf = self;
    
    
    
    
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




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString * cellId = @"videoCellId";
    
    
    
    EssenceVideoCell * cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    
    
    if (!cell){
        
        
        cell = [[[NSBundle mainBundle ] loadNibNamed: @"EssenceVideoCell"  owner:nil options:nil ] lastObject ];
        
    }
    
    
    ListModel * model = self.dataModel.list[indexPath.row];
    
    
    cell.model = model;
    
    return  cell;
    
    
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










/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
