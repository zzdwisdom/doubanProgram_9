//
//  doubanMovieViewController.m
//  doubanProgram
//
//  Created by MrXir on 13-4-23.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "doubanMovieViewController.h"
#import "JSON.h"
#import "movie.h"
#import "doubanplayViewController.h"
//#import "doubanplayViewController.h"
@interface doubanMovieViewController ()
{
UISearchBar * _searchBar;
}
@property(nonatomic,retain)movie *movie;
@property(nonatomic,retain)NSMutableArray *movies;
@property(nonatomic,retain) UIView *headerview;
@property (nonatomic, retain)NSMutableData *responseData;

@end

@implementation doubanMovieViewController
@synthesize monieTableView = _monieTableView;
-(void)dealloc
{
    [_monieTableView release];
    [_responseData release];
    [_movie release];
    [_movies release];
    [_headerview release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"电影";
                
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setBackgroundColor:[UIColor clearColor]];
        [titleButton setFrame:CGRectMake(0, 0, 180, 44)];
        [titleButton setTitle:@"电影 🎥" forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setShowsTouchWhenHighlighted:YES];
        self.navigationItem.titleView = titleButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 50.0)];
    headerview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerview];
    
    _monieTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 50.0, 320.0, 410.0) style:UITableViewStylePlain];
    _monieTableView.tag = 1;
    _monieTableView.delegate = self;
    _monieTableView.dataSource = self;
    self.monieTableView = _monieTableView;
    [self.view addSubview:_monieTableView];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, -44, 320, 44)];
    _searchBar.tintColor = [UIColor grayColor];
    _searchBar.frame = CGRectMake(0, 23, 320, 0);
    _searchBar.barStyle=UIBarStyleDefault;
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/movie/top250?apikey=0dea1ee3719c992829be5caa54d5cb78"]];
    //    [request setValue:_appkey forHTTPHeaderField:@"API-Key"];
    // 发送同步网络请求
    NSData *responseData2 = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    // 将返回数据responseData2转换为NSString，并输出
    NSString *responseString2 = [[NSString alloc] initWithData:responseData2 encoding:NSUTF8StringEncoding];
    //NSLog(@"asda%@",responseString2);
    NSString * xml = [[NSString alloc]initWithData:responseData2 encoding:NSUTF8StringEncoding];
    NSDictionary *_xmlDic = [xml JSONValue];
    
    //NSLog(@"asfafsasdfdsa%@",_xmlDic);
    NSMutableArray *movies = [NSMutableArray array];
    NSArray *  MovieList  =   [_xmlDic objectForKey:@"subjects"];
    for(NSDictionary *_dic in MovieList)
    {
        movie *mov = [[[movie alloc]init]autorelease];
        mov.movieName =  [_dic objectForKey:@"title"];
        mov.movieID = [_dic objectForKey:@"id"];
        mov.thumbnailURLString = [[_dic objectForKey:@"images"]objectForKey:@"small"];
        NSData *thumbnailData = [NSData dataWithContentsOfURL:[NSURL URLWithString:mov.thumbnailURLString]];
        mov.thumbnail = [UIImage imageWithData:thumbnailData];
        
        
        self.movies = movies;
        
        [self.movies addObject:mov];
        
        
    }
    
    [_monieTableView reloadData];
    [responseString2 release];
    [xml release];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return [self.movies count];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"OnlineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
    }
    movie *Mov = [self.movies objectAtIndex:indexPath.row];
    cell.textLabel.text = Mov.movieID;
    cell.textLabel.text = Mov.movieName;
    cell.imageView.image = Mov.thumbnail;
    cell.detailTextLabel.text = Mov.thumbnailURLString;
    //    cell.detailTextLabel.text = Mov.rating;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    movie *selectedMovie = [self.movies objectAtIndex:indexPath.row];
    doubanplayViewController *PlayVC = [[doubanplayViewController alloc] init];
    PlayVC.selectedMovie = selectedMovie;
    [self.navigationController pushViewController:PlayVC animated:YES];
    
    [PlayVC release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
