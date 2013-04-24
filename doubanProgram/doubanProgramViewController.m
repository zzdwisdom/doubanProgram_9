//
//  doubanProgramViewController.m
//  doubanProgram
//
//  Created by MrXir on 13-4-23.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "doubanProgramViewController.h"

#import <QuartzCore/QuartzCore.h>

//子应用
#import "doubanMusicViewController.h"
#import "doubanMovieViewController.h"
#import "doubanActivityViewController.h"

@interface doubanProgramViewController ()
{
    BOOL _isAppear;
    
    //豆瓣应用 按钮
    UIButton *navButton;
    
    //选择应用 视图
    UIView *selectView;
    
    //进入音乐应用 按钮
    UIButton *musButton;
    
    //进入电影应用 按钮
    UIButton *movButton;
    
    //进入活动应用 按钮
    UIButton *actButton;
    
    //转动的箭头 按钮
    UIButton *sjxButton;

    //三个应用的视图
    UIView *musicView;
    UIView *movieView;
    UIView *activityView;
    
    //三合一信息视图
    UIView *allInfView;
    
    //更多按钮
    UIButton *moreButton;
    
    //三合一信息视图上的分视图
    UIView *musInfView;
    UIView *movInfView;
    UIView *actInfView;
    
    UIButton * titleOfInfView;
    UIButton * backBarButton;

    
    
    
}

@end

@implementation doubanProgramViewController

- (void)dealloc
{
    [selectView release];
        
    [musicView release];
    
    [movieView release];
    
    [activityView release];
    
    [allInfView release];
    
    [musInfView release];
    
    [movInfView release];
    
    [actInfView release];
    

    
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"豆瓣应用";
        
        
        _isAppear = NO;
        
        //-->titleView
        navButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [navButton setBackgroundColor:[UIColor clearColor]];
        [navButton setFrame:CGRectMake(0, 0, 140, 44)];
        [navButton setTitle:@"豆瓣应用" forState:UIControlStateNormal];
        [navButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [navButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = navButton;
        
        sjxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sjxButton setFrame:CGRectMake(108, 10, 22, 22)];
        sjxButton.backgroundColor = [UIColor clearColor];
        [sjxButton setTitle:@"⬇" forState:UIControlStateNormal];
        [navButton addSubview:sjxButton];
        //<--
        
        //-->leftBarButtonItem
        backBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backBarButton.frame = CGRectMake(220, 3, 70, 38);
        backBarButton.layer.borderWidth = 1.5;
        backBarButton.layer.cornerRadius = 4;
        backBarButton.layer.borderColor = [[UIColor grayColor] CGColor];
        [backBarButton setTitle:@"返回" forState:UIControlStateNormal];
        [backBarButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [backBarButton addTarget:self action:@selector(everyBodyGoBack) forControlEvents:UIControlEventTouchUpInside];
        [backBarButton setHidden:YES];
        [backBarButton setShowsTouchWhenHighlighted:YES];

        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBarButton];
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        [leftBarButtonItem release],leftBarButtonItem = nil;
        //<--
        
        //-->rightBarButtonItem
        titleOfInfView = [UIButton buttonWithType:UIButtonTypeCustom];
        titleOfInfView.frame = CGRectMake(0, 3, 70, 38);
        titleOfInfView.layer.borderWidth = 1.5;
        titleOfInfView.layer.cornerRadius = 4;
        titleOfInfView.layer.borderColor = [[UIColor grayColor] CGColor];
        [titleOfInfView setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleOfInfView setHidden:YES];
        [titleOfInfView setShowsTouchWhenHighlighted:YES];
        
        UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:titleOfInfView];
        self.navigationItem.rightBarButtonItem = rightBarButton;
        [rightBarButton release],rightBarButton = nil;
        //<--
        

    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self creatAllDetailInfViewOfDouBan];
    
    [self creatAllConciseInfViewOfDouBan];
    
    [self creatSelectorOfDouBanDetailInf];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 创建 豆瓣应用的 音乐 电影 活动 详细信息视图
- (void)creatAllDetailInfViewOfDouBan
{
    
    [self musicDetailInfAPI];
    
    [self movieDetailInfAPI];
    
    [self activityDetailAPI];
    
}

#pragma mark - 音乐信息入口 （详细）
- (void)musicDetailInfAPI
{
    NSLog(@"添加音乐详细信息,暂用pushMusVCButton填充");
    musicView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:musicView];
    
    //详细音乐信息代码区
    //->
    
    
    
    //<-
    
    //进入音乐程序按钮 可替换成自定义内容
    UIButton *pushMusVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushMusVCButton.backgroundColor = [UIColor redColor];
    pushMusVCButton.frame = CGRectMake(0, 0, 320, 454);
    [pushMusVCButton setTitle:@"进入音乐" forState:UIControlStateNormal];
    [pushMusVCButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
    [pushMusVCButton setShowsTouchWhenHighlighted:YES];
    [musicView addSubview:pushMusVCButton];
    
}

#pragma mark - 电影信息入口 （详细）
- (void)movieDetailInfAPI
{
    NSLog(@"添加音乐详细信息,暂用pushMovVCButton填充");
    movieView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:movieView];
    
    //详细电影信息代码区
    //->
    
    
    
    //<-
    
    //进入电影程序按钮 可替换成自定义内容
    UIButton *pushMovVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushMovVCButton.backgroundColor = [UIColor greenColor];
    pushMovVCButton.frame = CGRectMake(0, 0, 320, 454);
    [pushMovVCButton setTitle:@"进入电影" forState:UIControlStateNormal];
    [pushMovVCButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
    [pushMovVCButton setShowsTouchWhenHighlighted:YES];
    [movieView addSubview:pushMovVCButton];
}

#pragma mark - 活动信息入口 （详细）
- (void)activityDetailAPI
{
    NSLog(@"添加音乐详细信息,暂用pushActVCButton填充");
    activityView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:activityView];
    
    //详细活动信息代码区
    //->
    
    
    
    //<-
    
    //进入活动程序按钮 可替换成自定义内容
    UIButton *pushActVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushActVCButton.backgroundColor = [UIColor blueColor];
    pushActVCButton.frame = CGRectMake(0, 0, 320, 454);
    [pushActVCButton setTitle:@"进入活动" forState:UIControlStateNormal];
    [pushActVCButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
    [pushActVCButton setShowsTouchWhenHighlighted:YES];
    [activityView addSubview:pushActVCButton];
}


#pragma mark - 创建 豆瓣应用的 音乐 电影 活动 简要信息视图
- (void)creatAllConciseInfViewOfDouBan
{

    allInfView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 454)];
    allInfView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:allInfView];
    
    [self musicConciseInfAPI];
    
    [self movieConciseInfAPI];
    
    [self activityConciseInfAPI];
  
}

#pragma mark - 音乐信息入口 （简要）
- (void)musicConciseInfAPI
{
    NSLog(@"添加音乐简要信息,暂用redColor填充");
    musInfView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)];
    musInfView.backgroundColor = [UIColor redColor];
    [allInfView addSubview:musInfView];
    
    //简要音乐信息代码区
    //->
    
    
    
    //<-
    
    //更多按钮 需要放在最顶层
    moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setFrame:CGRectMake(235, 115, 80, 30)];
    [moreButton setBackgroundColor:[UIColor brownColor]];
    [moreButton setTitle:@"More..." forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(whoseInfDoYouWantSomeMore:) forControlEvents:UIControlEventTouchUpInside];
    [moreButton setShowsTouchWhenHighlighted:YES];
    [musInfView addSubview:moreButton];
}

#pragma mark - 电影信息入口 （简要）
- (void)movieConciseInfAPI
{
    NSLog(@"添加电影简要信息,暂用greenColor填充");
    movInfView = [[UIView alloc]initWithFrame:CGRectMake(0, 150 + 2, 320, 150)];
    movInfView.backgroundColor = [UIColor greenColor];
    [allInfView addSubview:movInfView];
    
    //简要电影信息代码区
    //->
    
    
    
    //<-
    
    //更多按钮 需要放在最顶层
    moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setFrame:CGRectMake(235, 115, 80, 30)];
    [moreButton setBackgroundColor:[UIColor brownColor]];
    [moreButton setTitle:@"More..." forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(whoseInfDoYouWantSomeMore:) forControlEvents:UIControlEventTouchUpInside];
    [moreButton setShowsTouchWhenHighlighted:YES];
    [movInfView addSubview:moreButton];

}

#pragma mark - 活动信息入口 （详细）
- (void)activityConciseInfAPI
{
    NSLog(@"添加活动简要信息,暂用blueColor填充");
    actInfView = [[UIView alloc]initWithFrame:CGRectMake(0, 300 + 4, 320, 150)];
    actInfView.backgroundColor = [UIColor blueColor];
    [allInfView addSubview:actInfView];
    
    //简要活动信息代码区
    //->
    
    
    
    //<-
    
    //更多按钮 需要放在最顶层
    moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setFrame:CGRectMake(235, 115, 80, 30)];
    [moreButton setBackgroundColor:[UIColor brownColor]];
    [moreButton setTitle:@"More..." forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(whoseInfDoYouWantSomeMore:) forControlEvents:UIControlEventTouchUpInside];
    [moreButton setShowsTouchWhenHighlighted:YES];
    [actInfView addSubview:moreButton];
    
}


#pragma mark - 创建 豆瓣应用 选择器
- (void)creatSelectorOfDouBanDetailInf
{
    selectView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 140, 132)];
    selectView.center = CGPointMake(160, -66);
    selectView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:selectView];
    
    musButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [musButton setFrame:CGRectMake(0, 0, 140, 44)];
    [musButton setTitle:@"音乐" forState:UIControlStateNormal];
    [musButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [musButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
    
    movButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [movButton setFrame:CGRectMake(0, 44, 140, 44)];
    [movButton setTitle:@"电影" forState:UIControlStateNormal];
    [movButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [movButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
    
    actButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actButton setFrame:CGRectMake(0, 88, 140, 44)];
    [actButton setTitle:@"活动" forState:UIControlStateNormal];
    [actButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [actButton addTarget:self action:@selector(iWantToRunTheProgramByThisButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [navButton setShowsTouchWhenHighlighted:YES];
    [musButton setShowsTouchWhenHighlighted:YES];
    [movButton setShowsTouchWhenHighlighted:YES];
    [actButton setShowsTouchWhenHighlighted:YES];
    
    [selectView addSubview:musButton];
    [selectView addSubview:movButton];
    [selectView addSubview:actButton];
    
}

#pragma mark - 你想看哪个详细信息 ? 通过选择器 选择按钮
- (void)whichDetailInfDoYouWant:(UIButton *)selectedButton
{
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        if (_isAppear == NO)
        {
            [navButton setTitle:selectedButton.titleLabel.text forState:UIControlStateNormal];
            
            sjxButton.transform = CGAffineTransformMakeRotation( 180 * M_PI  / 180);
            
            selectView.center = CGPointMake(160, 66);
            
            _isAppear = YES;
            
            return;
        }
        
        if (_isAppear == YES)
        {
            
            [navButton setTitle:selectedButton.titleLabel.text forState:UIControlStateNormal];
            
            
            sjxButton.transform = CGAffineTransformMakeRotation( 360 * M_PI  / 180);
            
            
            selectView.center = CGPointMake(160, -66);
            
            _isAppear = NO;
            
            return;
        }
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    if ([selectedButton isEqual:musButton])
    {
        NSLog(@"你点击了musButton");
        [self whoIsGoingOut:nil whoHasClicked:musButton];
    }
    
    if ([selectedButton isEqual:movButton])
    {
        NSLog(@"你点击了movButton");
        [self whoIsGoingOut:nil whoHasClicked:movButton];
    }
    
    if ([selectedButton isEqual:actButton])
    {
        NSLog(@"你点击了actButton");
        [self whoIsGoingOut:nil whoHasClicked:actButton];
    }
    
}


#pragma mark - 你想看谁的更多信息 ? 通过点击它的按钮
- (void)whoseInfDoYouWantSomeMore:(UIButton *)someButton
{
    if ([someButton.superview isEqual:musInfView])
    {

        [titleOfInfView setTitle:@"音乐" forState:UIControlStateNormal];

        [self whoIsGoingOut:musInfView whoHasClicked:nil];
        
    }
    
    if ([someButton.superview isEqual:movInfView])
    {
        [titleOfInfView setTitle:@"电影" forState:UIControlStateNormal];


        [self whoIsGoingOut:movInfView whoHasClicked:nil];
        
    }
    
    if ([someButton.superview isEqual:actInfView])
    {
        
        [titleOfInfView setTitle:@"活动" forState:UIControlStateNormal];

        [self whoIsGoingOut:actInfView whoHasClicked:nil];
        
    }
    
}


#pragma mark - 想看谁,谁就出现
- (void)whoIsGoingOut:(UIView *)someBody whoHasClicked:(UIButton *)someButton
{
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        
        if ([someBody isEqual:musInfView] || [someButton isEqual:musButton])
        {
            musInfView.frame = CGRectMake(320, 0, 320, 150);
            movInfView.frame = CGRectMake(-320, 150 + 2, 320, 150);
            actInfView.frame = CGRectMake(-320, 300 + 4, 320, 150);
            
            allInfView.alpha = 0;
            
            NSLog(@"musicView出现");
            musicView.alpha = 1;
            movieView.alpha = 0;
            activityView.alpha = 0;
            
            
        }
        
        if ([someBody isEqual:movInfView] || [someButton isEqual:movButton])
        {
            musInfView.frame = CGRectMake(-320, 0, 320, 150);
            movInfView.frame = CGRectMake(320, 150 + 2, 320, 150);
            actInfView.frame = CGRectMake(-320, 300 + 4, 320, 150);
            
            allInfView.alpha = 0;
            
            NSLog(@"movieView出现");
            musicView.alpha = 0;
            movieView.alpha = 1;
            activityView.alpha = 0;
        }
        
        if ([someBody isEqual:actInfView] || [someButton isEqual:actButton])
        {
            musInfView.frame = CGRectMake(-320, 0, 320, 150);
            movInfView.frame = CGRectMake(-320, 150 + 2, 320, 150);
            actInfView.frame = CGRectMake(320, 300 + 4, 320, 150);
            
            allInfView.alpha = 0;
            
            NSLog(@"activityView出现");
            musicView.alpha = 0;
            movieView.alpha = 0;
            activityView.alpha = 1;
            
            
        }
        

        
  
    } completion:^(BOOL finished) {
        
        
        
        [titleOfInfView setHidden:NO];
        

        [backBarButton setHidden:NO];


        
    }];

    
}


#pragma mark - 返回 所有信息 视图
- (void)everyBodyGoBack
{

    
    NSLog(@"全部归位");
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            
        allInfView.alpha = 1;
            
        musInfView.frame = CGRectMake(0, 0, 320, 150);
        movInfView.frame = CGRectMake(0, 150 + 2, 320, 150);
        actInfView.frame = CGRectMake(0, 300 + 4, 320, 150);
        


            
    } completion:^(BOOL finished) {
        
        [navButton setTitle:@"豆瓣应用" forState:UIControlStateNormal];

        [titleOfInfView setHidden:YES];

        [backBarButton setHidden:YES];
        
        

        
        
    }];
    
}




#pragma mark - 进入用户选择的应用程序界面
- (void)iWantToRunTheProgramByThisButton:(UIButton *)someButton
{
    
    if ([someButton.superview isEqual:selectView] ||
        [someButton.superview isEqual:self.navigationController.navigationBar])
    {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            if (_isAppear == NO)
            {
                
                sjxButton.transform = CGAffineTransformMakeRotation( 180 * M_PI  / 180);
                
                selectView.center = CGPointMake(160, 66);
                
                _isAppear = YES;
                
                return;
            }
            
            if (_isAppear == YES)
            {
                
                
                
                sjxButton.transform = CGAffineTransformMakeRotation( 360 * M_PI  / 180);
                
                
                selectView.center = CGPointMake(160, -66);
                
                _isAppear = NO;
                
                return;
            }
            
        } completion:^(BOOL finished) {
            
        }];

    }
    
    
    if ([someButton.superview isEqual:musicView] || [someButton isEqual:musButton])
    {
        doubanMusicViewController *MusVC = [[doubanMusicViewController alloc]init];
        [self.navigationController pushViewController:MusVC animated:YES];
        NSLog(@"进入 Music");
        
        [MusVC release],MusVC = nil;
    }
    
    if ([someButton.superview isEqual:movieView] || [someButton isEqual:movButton])
    {
        doubanMovieViewController *MovVC = [[doubanMovieViewController alloc]init];
        [self.navigationController pushViewController:MovVC animated:YES];
        NSLog(@"进入 Movie");
        
        [MovVC release],MovVC = nil;
        
    }
    
    if ([someButton.superview isEqual:activityView] || [someButton isEqual:actButton])
    {
        doubanActivityViewController *ActVC = [[doubanActivityViewController alloc]init];
        [self.navigationController pushViewController:ActVC animated:YES];
        NSLog(@"进入 Activity");
        
        [ActVC release],ActVC = nil;
        
    }

    
    
}

@end
