//
//  ResumeTableViewCell.h
//  Nick'sResume
//
//  Created by 曾偉亮 on 2016/5/12.
//  Copyright © 2016年 TSENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResumeTableViewCell : UITableViewCell

-(void)refreshWithFrame:(CGRect)frame;

@property (strong, nonatomic) UILabel *m_title;
@property (strong, nonatomic) UILabel *m_subtitle;

@end
