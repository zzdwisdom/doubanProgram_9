//
//  doubanMusicViewController.m
//  doubanProgram
//
//  Created by MrXir on 13-4-23.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "doubanMusicViewController.h"

@interface doubanMusicViewController ()

@end

@implementation doubanMusicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"音乐";
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setBackgroundColor:[UIColor clearColor]];
        [titleButton setFrame:CGRectMake(0, 0, 180, 44)];
        [titleButton setTitle:@"音乐 🎵" forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setShowsTouchWhenHighlighted:YES];
        self.navigationItem.titleView = titleButton;
        

        
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    NSString *searchStr = @"经典";
    
    NSString *utf8Str = [searchStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self netRequestWithQ:utf8Str Tag:@"" Start:0 Count:10];
}


- (void)netRequestWithQ:(NSString *)q Tag:(NSString *)tag Start:(int)start Count:(int)count
{
    NSString *requestStr = [NSString stringWithFormat:@"https://api.douban.com/v2/music/search?q=%@&tag=%@&start=%d&count=%d",q,tag,start,count];
    
    NSURL *requestUrl = [NSURL URLWithString:requestStr];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:requestUrl cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10.0f];
    
    [urlRequest setHTTPMethod:@"GET"];
    
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
}

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    NSLog(@"将要发送请求");
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"将接收数据");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSDictionary *gotDic = [[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] JSONValue];
    
    NSLog(@"\n%@",gotDic);
    
    //结果数
//    NSNumber *count = [gotDic objectForKey:@"count"];
    
    NSArray *musicsArray = [gotDic objectForKey:@"musics"];
    
    //路径
    NSString *homePath = NSHomeDirectory();
    
    NSString *filePath = [homePath stringByAppendingFormat:@"musicArray.mus"];
    
    [NSKeyedArchiver archiveRootObject:musicsArray toFile:filePath];

    NSArray *turnArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"++++++%@++++++",turnArray);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *homePath = NSHomeDirectory();
    
    NSString *filePath = [homePath stringByAppendingFormat:@"musicArray.mus"];

    NSArray *turnArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"-----%@------",turnArray);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
