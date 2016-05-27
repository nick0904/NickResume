

#import "SubDetailViewController.h"

@interface SubDetailViewController () {
    
    UITextView *m_textView;
    UIScrollView *m_scrollView;
    NSMutableArray<UIImageView *> *ary_imgView;
    UILabel *labelImg;
    int totalPage;
    UILabel *label;
    
    //soho
    NSString *sohoStr;
    NSArray<UIImage *> *ary_sohoImg;
    
    //cec
    NSString *cecStr;
    NSArray<UIImage *> *ary_cecImg;
    
    //firstJob
    NSString *firstJobStr;
    NSArray<UIImage *> *ary_firstJobImg;
    
    //skill
    NSString *skill;
    NSArray<UIImage *> *ary_skillImg;

}

@end

@implementation SubDetailViewController

@synthesize theIndex;

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //****************  soho  ****************
    //sohoStr
    sohoStr = @"配合客戶繪製與修改相關工程圖:\n  1.結構施工圖。\n  2.裝修施工圖。\n  3.工程竣工圖。";
    //ary_sohoImg
    ary_sohoImg = [NSArray arrayWithObjects:[UIImage imageNamed:@"autocad_0.png"],[UIImage imageNamed:@"autocad_1.png"],[UIImage imageNamed:@"autocad_2.png"],[UIImage imageNamed:@"autocad_3.png"],[UIImage imageNamed:@"autocad_4.png"], nil];
    
    //****************  cec  *****************
    //cecStr
    cecStr = @"1.負責工地現場監工:\n責任工項與區域責任工項之監督及每日施工回報。\n\n2.協助業主與包商之協調溝通。\n\n3.工程師責任工項之數量計算與合約書撰寫。\n\n4.監督施工廠商整體進度與施工品質:\n每日施工進度之檢討、廠商供料之隨機抽查與提送第三方公正單位檢驗。\n\n5.維護施工現場機具與施工人員的安全:\n確實檢查施工人員所配戴之施工安全帽、反光背心、安全繩索、安全欄杆架設等相關工安規範。\n\n6.撰寫施工計畫書與提交審查,包含:\n工項施工總天數、每日施工人數、施工機具進出場動線、臨時情況備用方案等。\n\n7.主辦責任工項之工程招標與議價。\n\n8.施工界面協調與管控:\n與其他工項之工程師討論施工順序與裝修收邊等界面衝突。\n\n9.工地安全監測:\n地下水位高度、傾斜計、沈陷與隆起高度、鋼筋計、開挖支撐壓力計等相關安全監測數據之讀取與分析。\n\n10.工程師責任工項之預算追加減:\n根據合約內容、議價備註、現地施工情形辦理工程預算追加減。\n\n11.協助業主與客戶交屋:\n各項設備之使用方式說明與保養、陽露台洩水坡度之檢測、戶外窗嵌縫防水檢測、粉刷勻稱檢測、非主體結構物之客變檢測與客戶或業主所提額外工項之檢測。";
    //ary_cecImg
    ary_cecImg = [NSArray arrayWithObjects:[UIImage imageNamed:@"cec_0.png"],[UIImage imageNamed:@"cec_1.png"],[UIImage imageNamed:@"cec_2.png"],[UIImage imageNamed:@"cec_3.png"],[UIImage imageNamed:@"cec_4.png"], nil];
    
    //****************  firstJob  *****************
    //firstJobStr
    firstJobStr = @"工務所:\n\n  1.負責工地現場監工。\n\n  2.協助規劃大型機具進出。\n\n  3.規畫夜間施工道路封閉與人車改道。\n\n  4.核對鋼筋數量與號數。\n\n  5.混凝土現地坍度試驗與氯離子檢測。\n\n\n鄰房鑑定:\n\n  1.觀察鄰房室內樑、柱及牆面有無龜裂現象。\n\n  2.量測裂縫長度及寬度，並拍照存證。\n\n  3.量測樓層地面有無傾斜。\n\n  4.將鑑定資料建檔。";
    //ary_firstJobImg
    ary_firstJobImg = [NSArray arrayWithObjects:[UIImage imageNamed:@"first_0.png"],[UIImage imageNamed:@"first_1.png"],[UIImage imageNamed:@"first_2.png"], nil];
    
    //****************  skill  *****************
    //skill
    skill = @"1. iOS 開發語言:\n Objective-C , Swift。\n\n2. 電腦繪圖:\n Photoshop , AutoCad2D , AutoCad3D\n\n3. 證照資格:\n AutoCad 國際認證";
    //ary_skillImg
    ary_skillImg = [NSArray arrayWithObjects:[UIImage imageNamed:@"autocad.png"], nil];
    
    
    CGFloat baseH = navH + [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat labelH = frame.size.height/15;
    CGFloat itemH = (frame.size.height - baseH - labelH*2)/2;
    
    //****************  label  ****************
    label  = [[UILabel alloc] initWithFrame:CGRectMake(0, baseH, frame.size.width, labelH)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:labelH/2];
    [self.view addSubview:label ];
    
    //****************  m_textView  ****************
    m_textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, itemH)];
    m_textView.center = CGPointMake(frame.size.width/2, baseH + labelH + m_textView.frame.size.height/2);
    m_textView.font = [UIFont systemFontOfSize:labelH/2.5];
    m_textView.editable = NO;
    [self.view addSubview:m_textView];
    
    //****************  labelImg  ****************
    labelImg  = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(m_textView.frame), frame.size.width, labelH)];
    labelImg.textAlignment = NSTextAlignmentCenter;
    labelImg.backgroundColor = [UIColor purpleColor];
    labelImg.textColor = [UIColor whiteColor];
    labelImg.font = [UIFont boldSystemFontOfSize:labelH/2];
    labelImg.numberOfLines = 0;
    [self.view addSubview:labelImg ];
    
    //****************  m_scrollView  ****************
    m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(labelImg.frame), frame.size.width, itemH)];
    m_scrollView.pagingEnabled = true;
    m_scrollView.delegate = self;
    m_scrollView.bounces = false;
    [self.view addSubview:m_scrollView];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    
    switch (theIndex) {
        case 0:
            m_textView.text = sohoStr;
            self.title = @"自行接案";
            label.text = @"職 務 內 容";
            [self reloadImgView:ary_sohoImg];
            break;
        case 1:
            m_textView.text = cecStr;
            self.title = @"大陸工程";
            label.text = @"職 務 內 容";
            [self reloadImgView:ary_cecImg];
            break;
        case 2:
            m_textView.text = firstJobStr;
            self.title = @"三立建設";
            label.text = @"職 務 內 容";
            [self reloadImgView:ary_firstJobImg];
            break;
        case 7:
            self.title = @"技能證照";
            m_textView.text = skill;
            label.text = @"工作技能";
            [self reloadImgView:ary_skillImg];
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
    m_textView.contentOffset = CGPointMake(0, 0);
    totalPage = 0;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - reloadImgView
-(void)reloadImgView:(NSArray<UIImage *>*)ary_img {
    
    m_scrollView.contentSize = CGSizeMake(CGRectGetWidth(m_scrollView.frame)*ary_img.count, CGRectGetHeight(m_scrollView.frame));
    
    totalPage = (int)ary_img.count;
    
    if (theIndex == 7) {
        
        labelImg.text = [NSString stringWithFormat:@"證 照<1/%d>",totalPage];
    }
    else {
        
        labelImg.text = [NSString stringWithFormat:@"工 作 照 片<1/%d>",totalPage];
    }
    
    for (int i = 0; i < ary_img.count; i++) {
            
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0 + CGRectGetWidth(m_scrollView.frame)*i, 0, CGRectGetWidth(m_scrollView.frame), CGRectGetHeight(m_scrollView.frame))];
        imgView.image = ary_img[i];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.clipsToBounds = YES;
        imgView.backgroundColor = [UIColor whiteColor];
        [ary_imgView insertObject:imgView atIndex:i];
        [m_scrollView addSubview:imgView];
    }
    
}

#pragma mark - UIScroll Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    int currentPage = (int)(round(m_scrollView.contentOffset.x / m_scrollView.frame.size.width)) + 1;
    if (theIndex == 7) {
        
        labelImg.text = [NSString stringWithFormat:@"證 照<%d/%d>",currentPage,totalPage];
    }
    else {
        
        labelImg.text = [NSString stringWithFormat:@"工 作 照 片<%d/%d>",currentPage,totalPage];
    }
    
}


@end
