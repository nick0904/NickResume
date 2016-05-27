

#import "ResumeViewController.h"

@interface ResumeViewController () {
    
    UITableView *m_tableView;
    NSMutableArray *ary_title;
    NSMutableArray *ary_subtitle;
    DetailViewController *m_detailVC;
    AutobiographyViewController *m_autobiographyVC;
    ConnectionViewController *m_connectionVC;
    GitHubViewController *m_githubVC;
    SubDetailViewController *m_subDetailVC;
}

@end

@implementation ResumeViewController

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame navHeight:(CGFloat)navH {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    AppDelegate *m_delegate = [[UIApplication sharedApplication]delegate];
    [m_delegate.nav setNavigationBarHidden:false animated:true];
    
    ////**********  BarButtonItem  **********
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"聯絡資訊" style: UIBarButtonItemStylePlain target:self action:@selector(onBarBtAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我的App" style:UIBarButtonItemStylePlain target:self action:@selector(onBarBtAction:)];
    
    
    CGFloat baseH = navH + [[UIApplication sharedApplication] statusBarFrame].size.height ;
    //**********  imgView  **********
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, baseH, frame.size.width/2, frame.size.width/2*1.5)];
    imgView.center = CGPointMake(frame.size.width/2, baseH + imgView.frame.size.height/2);
    imgView.image = [UIImage imageNamed:@"nick03.png"];
    [imgView setClipsToBounds:true];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imgView];
    
    //**********  m_tableView  *********
    m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, baseH + imgView.frame.size.height, frame.size.width, frame.size.height - baseH - imgView.frame.size.height)];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    m_tableView.separatorColor = [UIColor blueColor];
    m_tableView.bounces = NO;
    [self.view addSubview:m_tableView];
    
    //**********  ary_title  *********
    ary_title = [[NSMutableArray alloc]init];
    [ary_title insertObject:@"姓名:" atIndex:0];
    [ary_title insertObject:@"性別:" atIndex:1];
    [ary_title insertObject:@"出生日期:" atIndex:2];
    [ary_title insertObject:@"兵役狀況:" atIndex:3];
    [ary_title insertObject:@"通訊地址:" atIndex:4];
    [ary_title insertObject:@"學歷與工作經歷" atIndex:5];
    [ary_title insertObject:@"求職條件" atIndex:6];
    [ary_title insertObject:@"技能證照" atIndex:7];
    [ary_title insertObject:@"自傳" atIndex:8];
    
    //**********  ary_subtitle  *********
    ary_subtitle = [[NSMutableArray alloc] init];
    [ary_subtitle insertObject:@"曾偉亮" atIndex:0];
    [ary_subtitle insertObject:@"男" atIndex:1];
    [ary_subtitle insertObject:@"1984年9月4日" atIndex: 2];
    [ary_subtitle insertObject:@"役畢" atIndex:3];
    [ary_subtitle insertObject:@"台中市南屯區河南路四段480-2號13樓" atIndex:4];
    [ary_subtitle insertObject:@"" atIndex:5];
    [ary_subtitle insertObject:@"" atIndex:6];
    [ary_subtitle insertObject:@"" atIndex:7];
    [ary_subtitle insertObject:@"" atIndex:8];

}

#pragma mark - UITableViewDataSource & UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return ary_title.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cell_id = @"CELL_ID";
    ResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if (cell == nil) {
        
        cell = [[ResumeTableViewCell alloc] init];
        [cell refreshWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/8)];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.m_title.font = [UIFont systemFontOfSize:cell.frame.size.height/4.5];
        cell.m_subtitle.font = [UIFont systemFontOfSize:cell.frame.size.height/4.5];
        cell.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
    }
    
    cell.m_title.text = ary_title[[indexPath row]];
    cell.m_subtitle.text = ary_subtitle[[indexPath row]];
    
    
    if (indexPath.row >=5 && indexPath.row <= 8) {
        
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.view.frame.size.height/8;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 5:
            if (m_detailVC == nil) {
                
                m_detailVC = [[DetailViewController alloc] init];
                [m_detailVC refreshWithFrame:self.view.frame];
            }
             m_detailVC.theNum = 5;
            [self.navigationController pushViewController:m_detailVC animated:YES];
            break;
        case 6:
            if (m_detailVC == nil) {
                
                m_detailVC = [[DetailViewController alloc] init];
                [m_detailVC refreshWithFrame:self.view.frame];
            }
            m_detailVC.theNum = 6;
            [self.navigationController pushViewController:m_detailVC animated:YES];
            break;
        case 7:
            if (m_subDetailVC == nil) {
                
                m_subDetailVC = [SubDetailViewController new];
                [m_subDetailVC refreshWithFrame:self.view.frame navHeight:self.navigationController.navigationBar.frame.size.height];
            }
            m_subDetailVC.theIndex = 7;
            [self.navigationController pushViewController:m_subDetailVC animated:YES];
            break;
        case 8:
            if (m_autobiographyVC == nil) {
                
                m_autobiographyVC = [AutobiographyViewController new];
                [m_autobiographyVC refreshWithFrame:self.view.frame navHeight:self.navigationController.navigationBar.frame.size.height filePath:[[NSBundle mainBundle] pathForResource:@"autobiography" ofType:@"txt"]];
            }
            [self.navigationController pushViewController:m_autobiographyVC animated:YES];
            break;
        default:
            break;
    }
    
}


#pragma mark - onBarBtAction
-(void)onBarBtAction:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"聯絡資訊"]) {
        
        if (m_connectionVC == nil) {
            
            m_connectionVC = [ConnectionViewController new];
            [m_connectionVC refreshWithFrame:self.view.frame];
        }
        
        [self.navigationController pushViewController:m_connectionVC animated:YES];
    }
    else if ([sender.title isEqualToString:@"我的App"]) {
        
        if(m_githubVC == nil) {
            
            m_githubVC = [GitHubViewController new];
            [m_githubVC refreshWithFrame:self.view.frame];
        }
        
        [self.navigationController pushViewController:m_githubVC animated:YES];
    }
    
}

@end
