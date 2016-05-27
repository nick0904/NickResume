//
//  ResumeTableViewCell.m
//  Nick'sResume
//
//  Created by 曾偉亮 on 2016/5/12.
//  Copyright © 2016年 TSENG. All rights reserved.
//

#import "ResumeTableViewCell.h"

@implementation ResumeTableViewCell

@synthesize m_title,m_subtitle;

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame {
    
    self.frame = frame;
    
    //************  m_title  ************
    m_title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, frame.size.width/3, frame.size.height)];
    m_title.textColor = [UIColor blackColor];
    m_title.adjustsFontSizeToFitWidth = YES;
    [self addSubview:m_title];
    
    //************  m_subtitle  ************
    m_subtitle = [[UILabel alloc] initWithFrame:CGRectMake(m_title.frame.size.width, 0, frame.size.width/3*2, frame.size.height)];
    m_subtitle.textColor = [UIColor blackColor];
    m_subtitle.numberOfLines = 0;
    [self addSubview:m_subtitle];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
