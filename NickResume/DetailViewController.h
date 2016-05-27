

#import <UIKit/UIKit.h>
#import "SubDetailViewController.h"
#import "ResumeTableViewCell.h"

@interface DetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

-(void)refreshWithFrame:(CGRect)frame;

@property NSInteger theNum;

@end
