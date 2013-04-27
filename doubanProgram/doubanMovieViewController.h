//
//  doubanMovieViewController.h
//  doubanProgram
//
//  Created by MrXir on 13-4-23.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface doubanMovieViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
@property (nonatomic,retain) UITableView*monieTableView;
@end
