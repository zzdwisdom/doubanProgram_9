//
//  doubanActivityViewController2.h
//  doubanProgram
//
//  Created by 徐 杨 on 13-4-26.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface doubanActivityViewController2 : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) Online *online;
@property (nonatomic, assign) NSInteger *moRenHeight;

@end
