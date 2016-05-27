

#import "ConnectionViewController.h"

@interface ConnectionViewController ()

@end

@implementation ConnectionViewController

#pragma mark - Normal Function
-(void)refreshWithFrame:(CGRect)frame {
    
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的聯絡資訊";
    
    //**************  mailBt  *****************
    UIButton *mailBt = [UIButton new];
    [self theButton:mailBt btTitle:@"我的電子郵件\nnick0904@hotmail.com" btTag:0];
    mailBt.center = CGPointMake(frame.size.width/2, frame.size.height/3);
    mailBt.backgroundColor = [UIColor orangeColor];
    
    //**************  phoneBt  *****************
    UIButton *phoneBt = [UIButton new];
    [self theButton:phoneBt btTitle:@"我的手機\n0985-670-886" btTag:1];
    phoneBt.center = CGPointMake(frame.size.width/2, frame.size.height/3*2);
    phoneBt.backgroundColor = [UIColor blueColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - bt 相關屬性設定
-(void)theButton:(UIButton *)bt btTitle:(NSString *)titleString btTag:(NSInteger)btTag {
    
    bt.frame = CGRectMake(0, 0, self.view.frame.size.width *0.8, self.view.frame.size.height/8);
    [bt setTitle:titleString forState:UIControlStateNormal];
    bt.titleLabel.numberOfLines = 0;
    bt.titleLabel.textAlignment = NSTextAlignmentCenter;
    bt.layer.shadowOffset = CGSizeMake(3.0, 6.0);
    bt.layer.shadowColor = [UIColor blackColor].CGColor;
    bt.layer.shadowOpacity = 0.88;
    [bt addTarget:self action:@selector(onBtAction:) forControlEvents:UIControlEventTouchUpInside];
    bt.tag = btTag;
    [self.view addSubview:bt];
}

#pragma mark - onBtAction
-(void)onBtAction:(UIButton *)sender {
    
    if (sender.tag == 0) {//email
        
        [self actionSheetShow:@"寄送電子郵件 ?" theTag:0];
    }
    else if (sender.tag == 1) {//smartPhone
        
        [self actionSheetShow:@"撥打電話 ?" theTag:1];
    }
}

#pragma mark - actionSheet
-(void)actionSheetShow:(NSString *)theTitle theTag:(NSInteger)theTag {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:theTitle message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (theTag == 0) {
            
            [self sendEmail:[NSArray arrayWithObjects:@"nick0904@hotmail.com", nil]];
        }
        else if (theTag == 1) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://0985670886"]];
        }
        
    }];
    [alert addAction:doneAction];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - sendEmail
-(void)sendEmail:(NSArray <NSString *> *)recipient {
    
    MFMailComposeViewController *mailCompseVC = [[MFMailComposeViewController alloc]init];
    
    if (!MFMailComposeViewController.canSendMail) {//判斷有無mail的功能
        
        return;
    }
    
    mailCompseVC.mailComposeDelegate = self;
    [mailCompseVC setToRecipients:recipient]; //設定收件者
    [self presentViewController:mailCompseVC animated:YES completion:nil];
    
}

#pragma mark - MFMailComposeViewController Delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    NSString *message;
    
    switch (result) {
        case MFMailComposeResultSent:
            message = @"郵件已寄出";
            break;
         case MFMailComposeResultSaved:
            message = @"郵件已儲存";
            break;
        case MFMailComposeResultCancelled:
            message = @"郵件已取消";
            break;
        case MFMailComposeResultFailed:
            message = [NSString stringWithFormat:@"郵件傳送失敗\n%@",error];
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:message message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDestructive handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
}



@end
