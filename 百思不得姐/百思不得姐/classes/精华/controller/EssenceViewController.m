//
//  EssenceViewController.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceModel.h"

#import "EssenceVideoCell.h"

@interface EssenceViewController () <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, assign) NSInteger lastTime ;


@property (nonatomic, strong) UITableView * tbView;


@property (nonatomic, strong) EssenceModel * dataModel;


@end

@implementation EssenceViewController




- (void) createTableView {


    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.tbView = [[UITableView alloc ] initWithFrame:  CGRectZero  style:UITableViewStylePlain ];
    
    
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    
    
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self.view addSubview: self.tbView ];



    __weak typeof (self) weakSelf = self;
    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(64, 0, 49, 0));
        
        
        
        
        
    } ];










}









- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView ] ;
    
    [self downloadData ];
    
    
    
    
    
}



- (void) downloadData{


    NSString * urlString = [ NSString stringWithFormat:kERecommendUrl, self.lastTime ];
    
     NSLog(@"%@",urlString);

    __weak typeof (self) weakSelf = self;
    
    [ BDJDownloader downloadWithUrlString:urlString finish:^(NSData *data) {
        
        
        
        
        
        EssenceModel * model = [[EssenceModel alloc ] initWithData:data error:nil ];
        
        
        NSLog(@"");
        
        weakSelf.dataModel = model;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [weakSelf.tbView reloadData ];
            
            
        });
        
        
        
        
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error.description);
        
    } ];
    
    
    

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



    return  500 ;


}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
