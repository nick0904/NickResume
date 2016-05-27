

#import <UIKit/UIKit.h>

@interface GitHubDetailViewController : UIViewController <UIScrollViewDelegate>

@property NSInteger index;;

@property NSString *m_titleStr;

-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH;

@end
