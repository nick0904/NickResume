

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ResumeTableViewCell.h"
#import "DetailViewController.h"
#import "AutobiographyViewController.h"
#import "ConnectionViewController.h"
#import "GitHubViewController.h"
#import "SubDetailViewController.h"

@interface ResumeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH;

@end
