//
//  doubanActivityViewController.m
//  doubanProgram
//
//  Created by MrXir on 13-4-23.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "doubanActivityViewController.h"

@interface doubanActivityViewController ()

@end

@implementation doubanActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"活动";
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setBackgroundColor:[UIColor clearColor]];
        [titleButton setFrame:CGRectMake(0, 0, 180, 44)];
        [titleButton setTitle:@"活动" forState:UIControlStateNormal];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
