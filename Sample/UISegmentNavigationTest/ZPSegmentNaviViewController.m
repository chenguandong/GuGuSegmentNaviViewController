//
//  GuGuSegmentNaviViewController.m
//
//  Created by gugupluto on 14-2-21.
//  http://www.cnblogs.com/gugupluto/
//  Copyright (c) 2014年 gugupluto. All rights reserved.
//

#import "ZPSegmentNaviViewController.h"
#import "ZPSegmentBarView.h"
#import "ZPLandscapeTableView.h"

#define kBarHeight 40
@interface ZPSegmentNaviViewController ()
{
    int currentIndex;
    NSArray *_titleArray;
    ZPLandscapeTableView *contentTable;
    ZPSegmentBarView *barView ;
}
@end

@implementation ZPSegmentNaviViewController



-(id)initWithItems:(NSArray*)titleArray
    andControllers:(NSArray*)controllers
   simpleTextColor:(UIColor*)simpleColor
   selectTextColor:(UIColor*)selectColor
         lineColor:(UIColor*)lineColor
   backgroundColor:(UIColor*)backgroundColor
{
    self = [super init];
    if (self)
    {
        NSString * tmpVersonType = [UIDevice currentDevice].systemVersion;
        
        NSArray * tmpArr = [tmpVersonType componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
        int y = 0;
        if([[tmpArr objectAtIndex:0] isEqualToString:@"7"])
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
            y = 64;
        }
        
        barView = [[ZPSegmentBarView alloc]initWithFrame:CGRectMake(0, y, 320, kBarHeight) andItems:titleArray simpleTextColor:simpleColor selectTextColor:selectColor lineColor:lineColor];
         barView.clickDelegate = self;
        

        //设置背景颜色
        barView.backgroundColor = backgroundColor;

        
        [self.view addSubview:barView];
       
        self.view.backgroundColor = [UIColor whiteColor];
        contentTable = [[ZPLandscapeTableView alloc]initWithFrame:CGRectMake(0,  kBarHeight + y, 320, self.view.frame.size.height - kBarHeight - y) Array:controllers];
        contentTable.swipeDelegate = self;
        
        [self.view addSubview:contentTable];
        
        
//        if (controllers.count > 0)
//        {
//            for (UIViewController *controller  in controllers)
//            {
//                //[self addChildViewController:controller];
//            }
//            currentIndex = 0;
//        }
        _titleArray = titleArray;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [_titleArray objectAtIndex:0];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)barSelectedIndexChanged:(int)newIndex
{
    if (newIndex >= 0)
    {
        currentIndex = newIndex;
        self.title = [_titleArray objectAtIndex:newIndex];
        [contentTable selectIndex:newIndex];
    }
}

-(void)contentSelectedIndexChanged:(int)newIndex
{
    [barView selectIndex:newIndex];

}




-(void)scrollOffsetChanged:(CGPoint)offset
{
    int page = (int)offset.y / 320 ;
    float radio = (float)((int)offset.y % 320)/320;
    [barView setLineOffsetWithPage:page andRatio:radio];

}






@end
