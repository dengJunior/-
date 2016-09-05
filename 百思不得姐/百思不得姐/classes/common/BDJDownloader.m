//
//  BDJDownloader.m
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import "BDJDownloader.h"

@implementation BDJDownloader





+ (void)downloadWithUrlString:(NSString *)urlString finish:(void (^)(NSData *))finishBlock failure:(void (^)(NSError *))failBlock {


    NSURL * url = [NSURL URLWithString: urlString ];
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL: url ];
    
    
    NSURLSession * session = [NSURLSession sharedSession ];
    
    
    
    
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
        if (error){
        
        
        
            failBlock(error);
        
        
        }else {
        
        
            NSHTTPURLResponse * httpRes = (NSHTTPURLResponse *) response ;
            
            
            if (httpRes.statusCode == 200 ) {
            
            
                finishBlock(data);
            
            
            
            
            }else {
            
            
            
                NSError * tempError = [NSError errorWithDomain: urlString code:httpRes.statusCode userInfo:@{ @"msg": @"请求数据 失败" } ];
            
            
                failBlock(tempError);
                
            
            }
            
        
        
        }
        
        
        
        
        
        
        
        
        
        
        
        
    } ];








    [task resume ];

















}

















@end
