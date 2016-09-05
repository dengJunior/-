//
//  BDJDownloader.h
//  百思不得姐
//
//  Created by 邓江洲 on 16/9/5.
//  Copyright © 2016年 邓江洲. All rights reserved.
//


typedef void (^FINISHBLOCK) (NSData * data);







#import <Foundation/Foundation.h>

@interface BDJDownloader : NSObject



+ (void) downloadWithUrlString: (NSString *) urlString finish: (void (^) (NSData * data)) finishBlock failure: (void (^) (NSError * error)) failBlock  ;






@end
