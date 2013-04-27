//
//  doubanActivityViewController2.m
//  doubanProgram
//
//  Created by 徐 杨 on 13-4-26.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "doubanActivityViewController2.h"
#import "doubanActivityViewController.h"

@interface doubanActivityViewController2 ()

@property (nonatomic, retain) UITableView *tableView;

@end

@implementation doubanActivityViewController2

-(float)returnRowHigetText:(NSString *)contentText :(NSInteger)whidth;
{
    UILabel *label=[[[UILabel alloc] initWithFrame:CGRectMake(0, 0, (float)whidth, 0)] autorelease];
    label.numberOfLines=0;
    label.text=[NSString stringWithFormat:@"%@",contentText];
    label.font=[UIFont fontWithName:@"Arial" size:14];
    [label sizeToFit];
    if ([contentText isEqualToString:@""]||contentText==nil)
    {
        return 50;
    }
    return label.frame.size.height*1.13;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [_online release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(5.0, 20.0, 310.0, 419.0) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.showsVerticalScrollIndicator = NO;

    [self.view addSubview:table];
    
    self.tableView = table;

    [table release];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)tableViewHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 10.0, 320, 170)];
    UIImageView *onlineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 10.0, 120, 150)];

    NSLog(@"%@",self.online.onlineImage);

    if (self.online.onlineImage)
    {
        onlineImage.image =self.online.onlineImage;
    }
    
    UILabel *onlineNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(135.0, 0.0, 180.0, 35.0)];
    UILabel *onlineOwnerLabel = [[UILabel alloc] initWithFrame:CGRectMake(140.0, 35.0, 180.0, 65)];
    onlineOwnerLabel.numberOfLines=0;
    UILabel *onlineDescLabel = [[UILabel alloc] initWithFrame:CGRectMake(140.0, 135.0, 180.0, 35.0)];
    onlineNameLabel.font = [UIFont fontWithName:@"Baskerville-Italic" size:19.0];
    onlineOwnerLabel.font = [UIFont fontWithName:@"Baskerville-SemiBold" size:16.0];
    onlineDescLabel.font = [UIFont fontWithName:@"Baskerville-SemiBold" size:12.0];
    
    onlineNameLabel.text = self.online.onlineTitle;
    onlineOwnerLabel.text = self.online.onlineOwner;

    if (!self.online.onlineDesc)
    {
        onlineDescLabel.text = @"未知";
    }
    else
    {
        onlineDescLabel.text = [NSString stringWithFormat:@"%@",self.online.onlineDesc];
    }
    [headerView addSubview:onlineDescLabel];
    [headerView addSubview:onlineNameLabel];
    [headerView addSubview:onlineOwnerLabel];
    [headerView addSubview:onlineImage];

    self.tableView.tableHeaderView = headerView;
    
    [onlineNameLabel release];
    [onlineDescLabel release];
    [onlineOwnerLabel release];
    [onlineImage release];
    [headerView release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 40;
    }
    else if (indexPath.section == 1)
    {
        return 40;
    }
    else
    {
        return [self returnRowHigetText:self.online.onlineDesc :310] + 20;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"活动名称：";
    }
    else if (section == 1)
    {
        return @"活动发起者：";
    }
    else
    {
        return @"活动简介：";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *identifier = @"onlineName";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
        }
        cell.textLabel.font=[UIFont fontWithName:@"Arial" size:14];
        cell.textLabel.numberOfLines=0;
        cell.textLabel.text= self.online.onlineTitle;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString *identifier = @"onlineOwner";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
        }
        cell.textLabel.numberOfLines=0;
        cell.textLabel.text=[NSString stringWithFormat:@"%@",self.online.onlineOwner];
        return  cell;
    }
    else
    {
        static NSString *identifier = @"onlineDesc";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell)
        {
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
        cell.textLabel.font=[UIFont fontWithName:@"Arial" size:14];
            [cell.textLabel sizeToFit];
        cell.textLabel.numberOfLines=0;
        cell.textLabel.text=[NSString stringWithFormat:@"%@",self.online.onlineDesc];

        }
        [self tableViewHeaderView];

        return  cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



















