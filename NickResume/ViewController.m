

#import "ViewController.h"

@interface ViewController () {
    
    UIButton *enterBt;
    UIImageView *finger;
    ResumeViewController *resumeVC;
    NSTimer *m_timer;
}

@end

@implementation ViewController

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //************  enterBt  ************
    enterBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width/1.5, frame.size.width/3)];
    enterBt.center = CGPointMake(frame.size.width/2, frame.size.height/2);
    [enterBt setTitle:@"我的履歷\n我的App" forState:UIControlStateNormal];
    enterBt.backgroundColor = [UIColor blueColor];
    enterBt.titleLabel.numberOfLines = 2;
    enterBt.layer.shadowOffset = CGSizeMake(3.0, 8.0);
    enterBt.layer.shadowOpacity = 0.88;
    enterBt.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    enterBt.titleLabel.font = [UIFont boldSystemFontOfSize:enterBt.frame.size.height/3];
    [enterBt setTitle:@"歡 迎 進 入" forState:UIControlStateHighlighted];
    [enterBt addTarget:self action:@selector(onBtAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterBt];
    
    //************  finger  ************
    finger = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width/3, frame.size.width/3)];
    finger.center = CGPointMake(frame.size.width/2, CGRectGetMaxY(enterBt.frame) + finger.frame.size.height/2);
    finger.image = [UIImage imageNamed:@"finger.png"];
    finger.layer.shadowOffset = CGSizeMake(3.0, 8.0);
    finger.layer.shadowOpacity = 0.88;
    finger.layer.shadowColor = [UIColor darkGrayColor].CGColor;

}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.8f target:self selector:@selector(showFinger) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - onBtAction
-(void)onBtAction:(UIButton*)sender {
    
    [m_timer invalidate];
    
    if (resumeVC == nil) {
        
        resumeVC = [[ResumeViewController alloc] init];
        [resumeVC refreshWithFrame:self.view.frame navHeight:self.navigationController.navigationBar.frame.size.height];
    }
    
    [self.navigationController pushViewController:resumeVC animated:true];
}

/*
 show Finger Function
 畫面載入後約0.8秒,如果按鍵尚未被使用者按下,則顯示 finger 提示
*/
#pragma mark - showFinger
-(void)showFinger {
    
    [self.view addSubview:finger];
    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear animations:^{
        
        finger.transform = CGAffineTransformMakeTranslation(0.0, finger.frame.size.height/2);
        
    } completion:nil];
}


@end
