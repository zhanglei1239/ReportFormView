//
//  ReportFormView.m
//  促利汇_渠道
//
//  Created by zhanglei on 15/4/27.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//
#define UI_SCREEN_WIDTH                    ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT                   ([[UIScreen mainScreen] bounds].size.height)
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#import "ReportFormView.h"
#import "OperactionStateCell.h"
@implementation ReportFormView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}


-(ReportFormView *)initWithFrame:(CGRect)frame width:(float)w dataWidth:(float)dw height:(float)h col:(NSInteger)c row:(NSInteger)r{
    cellWidth = w;
    dcellWidth = dw;
    cellHeight = h;
    col = c;
    row = r;
    return [self initWithFrame:frame];
}

-(void)setUI{
    
    [self setBackgroundColor:RGBACOLOR(39, 40, 41, 1)];
//    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.topLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cellWidth, cellHeight)];
    [self addSubview:self.topLeftView];
    
    self.topRightView = [[UIScrollView alloc] initWithFrame:CGRectMake(cellWidth, 0, UI_SCREEN_WIDTH-cellWidth, cellHeight)];
    [self.topRightView setContentSize:CGSizeMake(dcellWidth*col,cellHeight)];
    [self addSubview:self.topRightView];
    self.topRightView.delegate = self;
    self.topRightView.bounces = NO;
    
    self.bottomLeftView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, cellHeight, cellWidth, self.frame.size.height-cellHeight)];
    [self.bottomLeftView setContentSize:CGSizeMake(cellWidth, cellHeight*row)];
    [self addSubview:self.bottomLeftView];
    self.bottomLeftView.delegate = self;
    self.bottomLeftView.bounces = NO;
    
    self.bottomRightView = [[UIScrollView alloc] initWithFrame:CGRectMake(cellWidth, cellHeight, UI_SCREEN_WIDTH-cellWidth, self.frame.size.height-cellHeight)];
    self.bottomRightView.delegate = self;
    [self.bottomRightView setContentSize:CGSizeMake(dcellWidth*col,cellHeight*row)];
    [self addSubview:self.bottomRightView];
    self.bottomRightView.bounces = NO;
    
}

-(void)setWithData:(NSString *)topLeft items:(NSArray *)topRight names:(NSArray *)bottomLeft data:(NSArray *)bottomRight{
    [self initTopLeft:topLeft];
    [self initTopRight:topRight];
    [self initBottomLeft:bottomLeft];
    [self initBottomRight:bottomRight];
}

-(void)initTopLeft:(NSString *)topLeft{
    OperactionStateCell * cell = [[OperactionStateCell alloc] init];
    [cell setFrame:CGRectMake(0, 0, 70, 30)];
    [cell setUI];
    [cell.lblContent setText:topLeft];
    [cell setBackgroundColor:RGBACOLOR(58, 62, 63, 1)];
    [cell addSubview:cell.lblContent];
    [self.topLeftView addSubview:cell];
}

-(void)initTopRight:(NSArray *)arr{
    for (int i = 0; i<arr.count; i++) {
        OperactionStateCell * cell = [[OperactionStateCell alloc] init];
        [cell setFrame:CGRectMake(90*i, 0, 90, 30)];
        [cell setUI];
        [cell.lblContent setFont:[UIFont systemFontOfSize:10]];
        [cell.lblContent setText:[arr objectAtIndex:i]];
        [cell setBackgroundColor:RGBACOLOR(82, 83, 84, 1)];
        [cell addSubview:cell.lblContent];
        [cell.layer setBorderWidth:.5];
        [cell.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.topRightView addSubview:cell];
    }
}

-(void)initBottomLeft:(NSArray *)arr{
    for (int i = 0; i<arr.count; i++) {
        OperactionStateCell * cell = [[OperactionStateCell alloc] init];
        [cell setFrame:CGRectMake(0, 30*i, 70, 30)];
        [cell setUI];
        [cell.lblContent setText:[arr objectAtIndex:i]];
        [cell addSubview:cell.lblContent];
        [cell.layer setBorderWidth:.5];
        [cell.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.bottomLeftView addSubview:cell];
    }
}

-(void)initBottomRight:(NSArray *)arr{
    for (int i = 0; i<[arr count]; i++) {
        NSArray * a = [arr objectAtIndex:i];
        for (int j = 0; j<a.count; j++) {
            OperactionStateCell * cell = [[OperactionStateCell alloc] init];
            [cell setFrame:CGRectMake(90*j, i*30, 90, 30)];
            [cell setUI];
            [cell.lblContent setText:[a objectAtIndex:j]];
            [cell addSubview:cell.lblContent];
            [cell.layer setBorderWidth:.5];
            [cell.layer setBorderColor:[UIColor grayColor].CGColor];
            [self.bottomRightView addSubview:cell];
        }
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView == self.topRightView) {
        whichTouch = @"tr";
    }else if(scrollView == self.bottomLeftView){
        whichTouch = @"bl";
    }else if(scrollView == self.bottomRightView){
        whichTouch = @"br";
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.topRightView) {
        if ([whichTouch isEqualToString:@"tr"]) {
            [self.bottomRightView scrollRectToVisible:CGRectMake(scrollView.contentOffset.x, 0, self.bottomRightView.frame.size.width, self.bottomRightView.frame.size.height) animated:NO];
        }
    }else if(scrollView == self.bottomLeftView){
        if ([whichTouch isEqualToString:@"bl"]) {
            [self.bottomRightView scrollRectToVisible:CGRectMake(0, scrollView.contentOffset.y, self.bottomRightView.frame.size.width, self.bottomRightView.frame.size.height) animated:NO];
        }
    }else if(scrollView == self.bottomRightView){
        if ([whichTouch isEqualToString:@"br"]) {
            [self.topRightView scrollRectToVisible:CGRectMake(scrollView.contentOffset.x, 0, self.topRightView.frame.size.width, self.topRightView.frame.size.height) animated:NO];
            [self.bottomLeftView scrollRectToVisible:CGRectMake(0, scrollView.contentOffset.y, self.bottomLeftView.frame.size.width, self.bottomLeftView.frame.size.height) animated:NO];
        }
    }
}


@end
