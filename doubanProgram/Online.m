//
//  Online.m
//  doubanProgram
//
//  Created by 徐 杨 on 13-4-24.
//  Copyright (c) 2013年 MrXir. All rights reserved.
//

#import "Online.h"

@implementation Online

-(void)dealloc
{
    [_onlineId release];
    [_onlineImage release];
    [_onlineURLString release];
    [_onlineTitle release];
    [_onlineDesc release];
    [_beginTime release];
    [_endTime release];
    [_onlineOwner release];
    [super dealloc];
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"ID:%@  Title:%@",_onlineId,_onlineTitle];
}

@end
