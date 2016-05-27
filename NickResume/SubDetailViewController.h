

#import <UIKit/UIKit.h>

@interface SubDetailViewController : UIViewController <UIScrollViewDelegate>

-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH;

@property NSInteger theIndex;

@end
