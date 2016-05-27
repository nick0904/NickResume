

#import "AutobiographyViewController.h"

@interface AutobiographyViewController ()

@end

@implementation AutobiographyViewController

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH filePath:(NSString *)path {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自傳";
    
    NSError *readError;
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&readError];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0, frame.size.width *0.9, (frame.size.height)*0.88 - navH)];
    textView.center = CGPointMake(frame.size.width/2, frame.size.height/2 );
    textView.text = str;
    textView.font = [UIFont systemFontOfSize:textView.frame.size.width/15];
    textView.contentSize = CGSizeMake(frame.size.width, frame.size.height - 2*navH);
    textView.contentOffset = CGPointMake(0, navH);
    textView.editable = NO;
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
