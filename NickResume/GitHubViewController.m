

#import "GitHubViewController.h"

@interface GitHubViewController () {
    
    UITableView *m_tableView;
    NSArray<UIImage *> *ary_img;
    NSArray<NSString *> *ary_titleStr;
    GitHubDetailViewController *m_githubDetailVC;
}

@end

@implementation GitHubViewController

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的App";
    
    //**********  m_tableView  **********
    m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self.view addSubview:m_tableView];
    
    
    //**********  ary_img  **********
    ary_img = [NSArray arrayWithObjects:[UIImage imageNamed:@"rgbIcon@3.png"],[UIImage imageNamed:@"funnyGameIcon@3.png"],[UIImage imageNamed:@"guessIcon@3.png"],[UIImage imageNamed:@"petIcon@3.png"],[UIImage imageNamed:@"yesnoIcon@180.png"],[UIImage imageNamed:@"bsIcon180.png"],[UIImage imageNamed:@"bikeIcon@180.png"],[UIImage imageNamed:@"postit@3.png"],nil];
    
    //**********  ary_titleStr  **********
    ary_titleStr = [NSArray arrayWithObjects:@"RGB調色盤",@"圈圈叉叉" ,@"猜數字遊戲",@"台北市動物之家",@"機率遊戲",@"比大小",@"台中微笑單車",@"便利貼",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate & UITableViewData Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return ary_titleStr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *github_cell_id = @"GITHUB_CELL_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:github_cell_id];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:github_cell_id];
        cell.imageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        cell.imageView.layer.cornerRadius =  10;
        cell.imageView.clipsToBounds = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.imageView.image = ary_img[[indexPath row]];
    cell.textLabel.text = ary_titleStr[[indexPath row]];
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (m_githubDetailVC == nil) {
        
        m_githubDetailVC = [GitHubDetailViewController new];
        [m_githubDetailVC refreshWithFrame:self.view.frame navHeight:self.navigationController.navigationBar.frame.size.height];
    }
    
    m_githubDetailVC.index = indexPath.row;
    m_githubDetailVC.m_titleStr = ary_titleStr[indexPath.row];
    [self.navigationController pushViewController:m_githubDetailVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  self.view.frame.size.height/6;
}




@end
