//
//  OperactionStateCell.m
//  促利汇_渠道
//
//  Created by zhanglei on 15/4/27.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import "OperactionStateCell.h"

@implementation OperactionStateCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)setUI{ 
    self.lblContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.lblContent setTextColor:[UIColor whiteColor]];
    [self.lblContent setFont:[UIFont systemFontOfSize:12]];
    [self.lblContent setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.lblContent];
}
@end
