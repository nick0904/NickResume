

#import "GitHubDetailViewController.h"

@interface GitHubDetailViewController () {
    
    UIScrollView *m_scrollView;
    NSMutableArray<UIImageView *> *ary_imgView;
    UILabel *m_content;
    UIPageControl *m_pageControl;
    UIButton *m_connectionBt;
    NSDictionary *dic_app;
    
    CGFloat imgViewW;
    CGFloat spaceW;
    CGFloat baseH;
    CGFloat spaceH;
    
    NSString *str;
}

@end

@implementation GitHubDetailViewController

@synthesize index;

-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.25 blue:0.0 alpha:1.0];
    baseH = navH + [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat connectionBtH = frame.size.height/15;
    spaceH = (frame.size.height - baseH - 4*connectionBtH)/20;
    CGFloat scrollViewH = (frame.size.height - baseH - 4*connectionBtH);
    imgViewW = (scrollViewH-spaceH)/1.8;
    spaceW = (frame.size.width - imgViewW)/2;
    ary_imgView = [NSMutableArray new];
    str = @"GitHub連結\n";
    //*************  m_scrollView  **************
    m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, baseH, frame.size.width, scrollViewH)];
    m_scrollView.pagingEnabled = YES;
    m_scrollView.backgroundColor = [UIColor colorWithRed:1.0 green:0.25 blue:0.0 alpha:1.0];
    m_scrollView.delegate = self;
    m_scrollView.showsVerticalScrollIndicator = NO;
    m_scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:m_scrollView];
    
    //*************  m_content  **************
    m_content = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(m_scrollView.frame), frame.size.width, connectionBtH )];
    m_content.numberOfLines = 0;
    m_content.textAlignment = NSTextAlignmentCenter;
    m_content.adjustsFontSizeToFitWidth = YES;
    m_content.adjustsFontSizeToFitWidth = YES;
    m_content.backgroundColor = m_scrollView.backgroundColor;
    m_content.font = [UIFont boldSystemFontOfSize:m_content.frame.size.height/2];
    m_content.textColor = [UIColor whiteColor];
    [self.view addSubview:m_content];
    
    //*************  m_pageControl  **************
    m_pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(m_content.frame), frame.size.width, connectionBtH)];
    m_pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    m_pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    m_pageControl.currentPage = 0;
    m_pageControl.backgroundColor = m_scrollView.backgroundColor;
    [self.view addSubview:m_pageControl];
    
    //*************  connectionBt  **************
    m_connectionBt = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(m_pageControl.frame), frame.size.width, connectionBtH*2)];
    m_connectionBt.backgroundColor = [UIColor blackColor];
    [m_connectionBt setTitle:@"GitHub連結\nhttps://github.com/nick0904/PetApp" forState:UIControlStateNormal];
    m_connectionBt.titleLabel.numberOfLines = 0;
    m_connectionBt.titleLabel.adjustsFontSizeToFitWidth = YES;
    m_connectionBt.titleLabel.textAlignment = NSTextAlignmentCenter;
    [m_connectionBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [m_connectionBt setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [m_connectionBt addTarget:self action:@selector(onConnectionBtAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:m_connectionBt];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    m_pageControl.currentPage = 0;
    
    //**************  NSJSONSerialization  ************
    NSString *pathStr = [[NSBundle mainBundle]pathForResource:@"sample" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:pathStr];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *ary_json = [dic objectForKey:@"samples"];
    dic_app = ary_json[index];
   
    NSArray *ary_app_img = [dic_app objectForKey:@"imgStr"];
    [self reloadImgView:ary_app_img];
   
    NSArray *ary_content = [dic_app objectForKey:@"content"];
    m_content.text =  ary_content[0];
    
    NSString *urlStr = [dic_app objectForKey:@"github"];
    [m_connectionBt setTitle:[str stringByAppendingString:urlStr] forState:UIControlStateNormal];
    
    switch (index) {
        case 0:
            self.title = @"RGB調色盤";
            break;
        case 1:
            self.title = @"圈圈叉叉";
            break;
        case 2:
            self.title = @"猜數字遊戲";
        case 3:
            self.title = @"台北市動物之家";
            break;
        default:
            break;
    }
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    for (int i = 0; i<ary_imgView.count; i++) {
        
        [ary_imgView[i] removeFromSuperview];
    }
    [ary_imgView removeAllObjects];
    m_scrollView.contentOffset = CGPointMake(0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - UIScrollView Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger currentPageNum = (int)(round(m_scrollView.contentOffset.x/m_scrollView.frame.size.width));
    NSArray *ary_content = [dic_app objectForKey:@"content"];
    m_content.text = ary_content[currentPageNum];
    m_pageControl.currentPage = currentPageNum;
}

#pragma mark - reloadImgView
-(void)reloadImgView:(NSArray<NSString *>*)ary_imgStr {
    
    m_scrollView.contentSize = CGSizeMake(CGRectGetWidth(m_scrollView.frame)*ary_imgStr.count, CGRectGetHeight(m_scrollView.frame)-baseH);
    m_pageControl.numberOfPages = ary_imgStr.count;
    
    for (int i = 0; i < ary_imgStr.count; i++) {
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceW*(2*i+1)+imgViewW*(i), 0-baseH + spaceH, imgViewW, CGRectGetHeight(m_scrollView.frame)-spaceH)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",ary_imgStr[i]]];
        //imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds = YES;
        [m_scrollView addSubview:imgView];
        [ary_imgView insertObject:imgView atIndex:i];
    }
    
}

#pragma mark - onConnectionBtAction
-(void)onConnectionBtAction:(UIButton *)sender {
    
    NSString *urlStr = [dic_app objectForKey:@"github"];
    [self alertshow:urlStr];
}

#pragma mark - alertShow
-(void)alertshow:(NSString *)theURLStr {
    
    NSString *str01 = @"前往 ";
    NSString *str02 = [str01 stringByAppendingString:theURLStr];
    NSString *str03 = [str02 stringByAppendingString:@" ?"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:str03 message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        dispatch_after(0.2, dispatch_get_main_queue(), ^{
            
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:theURLStr]];
        });
    }];
    [alert addAction:doneAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:cancelAction];

    [self presentViewController:alert animated:YES completion:nil];
}


@end
