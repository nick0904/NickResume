

#import <UIKit/UIKit.h>
#import "GitHubDetailViewController.h"

@interface GitHubViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

-(void)refreshWithFrame:(CGRect)frame;

@end
