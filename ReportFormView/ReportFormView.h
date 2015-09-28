//
//  ReportFormView.h
//  促利汇_渠道
//
//  Created by zhanglei on 15/4/27.
//  Copyright (c) 2015年 lei.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportFormView : UIView<UIScrollViewDelegate>{
    float cellWidth;
    float dcellWidth;
    float cellHeight;
    int col;
    int row;
    NSString *whichTouch;
}
@property (nonatomic, strong) UIView * topLeftView;
@property (nonatomic, strong) UIScrollView * topRightView;
@property (nonatomic, strong) UIScrollView * bottomLeftView;
@property (nonatomic, strong) UIScrollView * bottomRightView;
@property (nonatomic, strong) NSArray * arrTopLeft;
@property (nonatomic, strong) NSArray * arrTopRight;
@property (nonatomic, strong) NSArray * arrBottomLeft;
@property (nonatomic, strong) NSArray * arrBottomRight;

-(ReportFormView *)initWithFrame:(CGRect)frame width:(float)w dataWidth:(float)dw height:(float)h col:(NSInteger)c row:(NSInteger)r;
-(void)setWithData:(NSString *)topLeft items:(NSArray *)topRight names:(NSArray *)bottomLeft data:(NSArray *)bottomRight;
@end
