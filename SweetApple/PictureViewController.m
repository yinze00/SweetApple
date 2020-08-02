//
//  PictureViewController.m
//  SweetApple
//
//  Created by yinze on 2020/8/2.
//  Copyright © 2020 yinze. All rights reserved.
//

#import "PictureViewController.h"
#import <ZLPhotoBrowser/ZLPhotoBrowser.h>
#import "Masonry.h"

@interface PictureViewController ()
@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIView *loginbtn;
@property (strong, nonatomic) IBOutlet UIButton *forgetpwbtn;
@property (strong, nonatomic) IBOutlet UIButton *registerbtn;
@property(nonatomic,strong) UIButton* picbtn;
@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"主d面";
    [self makeui];
    
    self.password.secureTextEntry = true;
    
}
- (IBAction)loginbtnclicked:(id)sender {
    NSString * accountstr = self.account.text;
    NSString * passwdstr  = self.password.text;
    
    NSLog(accountstr);
    //
    UserInfo* currlogin = [[UserInfo alloc]init];
    [self.delegate additemvc:self didFinishenteringitem:currlogin];
//    [self]
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的

}

- (void)makeui{
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
