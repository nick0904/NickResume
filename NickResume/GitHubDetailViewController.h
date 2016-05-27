

#import <UIKit/UIKit.h>

@interface GitHubDetailViewController : UIViewController <UIScrollViewDelegate>

@property NSInteger index;

-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH;

@end
