//
//  ViewController.m
//  ReportFormView
//
//  Created by zhanglei on 15/9/28.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#define UI_SCREEN_WIDTH                    ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT                   ([[UIScreen mainScreen] bounds].size.height)
#define UI_DeviceSystemVersion             [[UIDevice currentDevice].systemVersion intValue]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#import "ViewController.h"
#import "ReportFormView.h"
@interface ViewController ()
{
    NSArray * contentTitleArr;
    NSArray * contentArrs;
    NSArray * titleArrs;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,UI_SCREEN_WIDTH,60)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, UI_SCREEN_WIDTH, 40)];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:@"报表展示"];
    [self.view addSubview:title]; 
    
    contentTitleArr = [NSArray arrayWithObjects:@"联盟商家数量",@"预存次数",@"预存量",@"渠道佣金已结算",@"渠道佣金未结算",@"渠道佣金总额",@"业务员佣金已结算",@"业务员佣金未结算",@"业务员总额",@"利润",nil];
    NSArray * arr = [NSArray arrayWithObjects:@"200",@"20",@"20",@"2000",@"200",@"2200",@"2000",@"200",@"2200",@"1800", nil];
    contentArrs = [NSMutableArray arrayWithObjects:arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr,arr, nil];
    
    titleArrs = [NSMutableArray arrayWithObjects:@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯",@"秋林里道斯", nil];
    ReportFormView * pfView = [[ReportFormView alloc] initWithFrame:CGRectMake(0, 60, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT-60) width:70 dataWidth:90 height:30 col:contentTitleArr.count row:contentArrs.count];
    [pfView setWithData:@"联盟商家" items:contentTitleArr names:titleArrs data:contentArrs];
    [self.view bringSubviewToFront:pfView];
    [self.view addSubview:pfView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
