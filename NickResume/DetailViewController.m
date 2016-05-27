

#import "DetailViewController.h"

@interface DetailViewController () {
    
    UITableView *m_tableView;
    SubDetailViewController *m_subDetailVC;
    
    //學經歷相關宣告
    NSArray *ary_sectionTitle;
    NSMutableArray *ary_school;
    NSMutableArray *ary_work;
    
    //求職條件相關宣告
    NSMutableArray *ary_jobTitle;
    NSMutableArray *ary_jobDescription;
}

@end

@implementation DetailViewController

@synthesize theNum;

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = frame;
    
    //***********  ary_sectionTitle  **********
    ary_sectionTitle = [NSArray arrayWithObjects:@"學 歷",@"工 作 經 歷", nil];
    
    //***********  ary_school  ************
    ary_school = [NSMutableArray new];
    [ary_school insertObject:@"國立台北科技大學\n土木防災研究所\n2008／09～2010／07(肄業)" atIndex:0];
    [ary_school insertObject:@"國立臺灣海洋大學\n河海工程學系\n2004／09～2008／06(畢業)" atIndex:1];
    
    //***********  ary_work  *************
    ary_work = [NSMutableArray new];
    [ary_work insertObject:@"自行接案\n繪製與修改工程圖\n2015／01～2016／04" atIndex:0];
    [ary_work insertObject:@"大陸工程\n建築工程師\n2013／07～2014／12" atIndex:1];
    [ary_work insertObject:@"三立建設\n土木技師助理\n2012／08～2013／06" atIndex:2];
    
    //***********  ary_jobTitle  *************
    ary_jobTitle = [NSMutableArray new];
    [ary_jobTitle insertObject:@"應徵職稱:" atIndex:0];
    [ary_jobTitle insertObject:@"最快可上班日:" atIndex:1];
    [ary_jobTitle insertObject:@"希望工作地點:" atIndex:2];
    [ary_jobTitle insertObject:@"職務內容描述:" atIndex:3];
    [ary_jobTitle insertObject:@"希望待遇:" atIndex:4];
    
    //***********  ary_jobDescription  *************
    ary_jobDescription = [NSMutableArray new];
    [ary_jobDescription insertObject:@"iOS App 開發工程師" atIndex:0];
    [ary_jobDescription insertObject:@"隨時可上班" atIndex:1];
    [ary_jobDescription insertObject:@"台中市" atIndex:2];
    [ary_jobDescription insertObject:@"1. iOS  App  之設計、開發、測試、維護及分析。\n\n2. 配合公司專案規畫、開發及討論。\n\n3. 研究Apple公司釋出的最新語法、技術與框架。\n\n4. 配合公司的發展趨勢,學習新的程式語言。" atIndex:3];
    [ary_jobDescription insertObject:@"面 議" atIndex:4];
    
    
    //***********  m_tableView  ************
    m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:m_tableView];
    [m_tableView reloadData];
    
    switch (theNum) {
        case 5:
            self.title = @"學經歷" ;
            m_tableView.separatorColor = [UIColor blackColor];
            m_tableView.backgroundColor = [UIColor whiteColor];
            break;
        case 6:
            self.title = @"求職條件";
            m_tableView.separatorColor = [UIColor redColor];
            m_tableView.backgroundColor = [UIColor blackColor];
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger num = 1;
    
    if (theNum == 5) {
        
        num = ary_sectionTitle.count;
    }
    else if (theNum == 6) {
        
        num = 1;
    }
    
    return num;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *label;
    
    if (theNum == 5) {
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/10)];
        label.backgroundColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:label.frame.size.height/3];
        label.text = ary_sectionTitle[section];
        
    }
    else {
        
        label.frame = CGRectMake(0, 0, 0, 0);
    }
    
    return label;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger num = 1;
    
    if (theNum == 5) {
        
        switch (section) {
            case 0:
                num = ary_school.count;
                break;
            case 1:
                num = ary_work.count;
                break;
            default:
                break;
        }

    }
    else if (theNum == 6) {
        
        num = ary_jobTitle.count;
    }

    return num;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if (theNum == 5) {
        
        NSString *detail_cell_id_5 = @"DETAIL_CELL_ID_5";
        cell= [tableView dequeueReusableCellWithIdentifier:detail_cell_id_5];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detail_cell_id_5];
            cell.textLabel.numberOfLines = 0;
        }
        
        switch (indexPath.section) {
            case 0:
                cell.textLabel.text = ary_school[indexPath.row];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                break;
            case 1:
                cell.textLabel.text = ary_work[indexPath.row];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];
                break;
            default:
                break;
        }

    }
    else if (theNum == 6 ) {
        
        NSString *detail_cell_id_6 = @"DETAIL_CELL_ID_6";
        ResumeTableViewCell *theCell = (ResumeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:detail_cell_id_6];
        if (theCell == nil) {
            
            theCell = [ResumeTableViewCell new];
            [theCell refreshWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 10, self.view.frame.size.height/8)];
            theCell.selectionStyle = UITableViewCellSelectionStyleNone;
            theCell.backgroundColor = [UIColor blackColor];
        }
        cell = theCell;
        theCell.m_title.text = ary_jobTitle[[indexPath row]];
        theCell.m_title.textColor = [UIColor cyanColor];
        theCell.m_subtitle.text = ary_jobDescription[[indexPath row]];
        theCell.m_subtitle.textColor = [UIColor whiteColor];
        
        if (indexPath.row == 3) {
         
            theCell.m_subtitle.clipsToBounds = YES;
            theCell.m_subtitle.frame = CGRectMake(CGRectGetMaxX(theCell.m_title.frame), 0, self.view.frame.size.width - theCell.m_title.frame.size.width, self.view.frame.size.height/2.5);
            theCell.m_title.frame = CGRectMake(10, 0, self.view.frame.size.width/3, CGRectGetHeight(theCell.m_subtitle.frame));
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (theNum == 5) {
        
        if (indexPath.section == 1) {
            
            if (m_subDetailVC == nil) {
                
                m_subDetailVC = [SubDetailViewController new];
                [m_subDetailVC refreshWithFrame:self.view.frame navHeight:self.navigationController.navigationBar.frame.size.height];
            }
            
            switch (indexPath.row) {
                case 0:
                    m_subDetailVC.theIndex = 0;
                    break;
                case 1:
                    m_subDetailVC.theIndex = 1;
                    break;
                case 2:
                    m_subDetailVC.theIndex = 2;
                    break;
                default:
                    break;
            }
            
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            [self.navigationController pushViewController:m_subDetailVC animated:YES];
        }
    
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat rowHeight = self.view.frame.size.height/8;
    
    if (theNum == 6) {
        
        if (indexPath.row == 3) {
            
            rowHeight = self.view.frame.size.height/2.5;
        }
    }
    return rowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    CGFloat headerHeight = self.view.frame.size.height/10;
    
    if (theNum == 6) {
        
        headerHeight = 0.0;
    }
    
    return  headerHeight;
}




@end
