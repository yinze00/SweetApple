//
//  ViewController.m
//  SweetApple
//
//  Created by yinze on 2020/8/1.
//  Copyright © 2020 yinze. All rights reserved.
//

#import "ViewController.h"
#import "PictureViewController.h"
#import "Masonry.h"
#import <ZLPhotoBrowser/ZLPhotoBrowser.h>
#import "UserInfo.h"
#import <SDWebImage/UIImageView+WebCache.h>


//#import
//#import "N"
//#import “NSURLSession"

@interface ViewController ()
@property(nonatomic,strong) UIButton* PicBtn;
@property(nonatomic,strong) UILabel*  prompt;
@property(nonatomic,strong) UIImage* img;
@property(nonatomic,strong) UIButton* uploadbtn;
@property(nonatomic,strong) UIButton* repicbtn;
@property(nonatomic,strong) UIImageView* APPShow;
@property(nonatomic,assign) Boolean* rec;
@property(nonatomic,assign) Boolean* a;

@property(nonatomic,strong) UserInfo* curruser;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"主页面";
    self.rec = false;
    [self MakeUI];
//    NSDate * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://www.wangjunwei.top/img/me.jpeg"]];
//    self.img = [[UIImage alloc]initWithData: data];
//    [self.APPShow sd_setImageWithURL:[NSURL URLWithString:@"https://www.wangjunwei.top/img/me.jpeg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [self.APPShow sd_setImageWithURL:[NSURL URLWithString:@"https://www.wangjunwei.top/img/me.jpeg"]
                    placeholderImage:[UIImage imageNamed:@"myPlaceHolder"]
                             options:SDWebImageRetryFailed | SDWebImageFromCacheOnly
                            progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * targetURL){
                            NSLog(@"%ld,%ld",receivedSize,expectedSize);

        }
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            if (error) {
                            }
                            else {
                                
                            }
                            }
     ];

    
    NSLog(@"done");
}

- (void) additemvc:(PictureViewController *)c didFinishenteringitem:(nonnull UserInfo *)item{
//    self.curruser = item.copy;
    self.curruser = [[UserInfo alloc]init];
    self.curruser.username = item.username;
    self.curruser.usericon = item.usericon;
    self.curruser.accesstoken = item.accesstoken;
    NSString *sdfa = [[NSString alloc]initWithString:self.curruser.username];
    NSLog(sdfa,nil);
    NSLog(@"success");
    // 这里写登录程序
    
    
    
}

- (void) uploadbtnclicked{
    NSLog(@"upload");
    // 此时开始将self.img 上传到服务器www.wangjunwei.top
    if(!self.rec){
//        UIAlertView *notlogin = [[UIAlertAction alloc]init];
        // 方式1 无代理，只有一个确定按钮（左右排列，取消按钮在左，确定按钮在右）
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:
        @"当前未登录" message:@"即将引导您登录/注册"
        preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action){
        }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action)
                                                         {
//            NSLog(@"SDdfasd")
            PictureViewController *picview = [[PictureViewController alloc]init];
            picview.delegate = self;
            [self showDetailViewController:picview sender:self];
            
                                                         }
                                   ];

        [alertController addAction:cancelAction];
        [alertController addAction:okAction];

        [self presentViewController:alertController animated:YES completion:nil];
//        [self.navigationController pushViewController:alertController animated:true];


    }
    
}


- (void) PicbtnClicked{
//    PictureViewController* vpic = [[PictureViewController alloc]init];
////    [self.navigationController pushViewController:vpic animated:true];
//    [self showDetailViewController:vpic sender:nil];
    ZLCustomCamera* camera = [[ZLCustomCamera alloc]init];
    camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
        // 自己需要在这个地方进行图片或者视频的保存
        self.img = image;
        [self.APPShow setImage:self.img];
        [self UIchanged];
        
    };

    [self showDetailViewController:camera sender:nil];
}

- (UIImageView*)APPShow{
    if(!_APPShow){
        _APPShow = [[UIImageView alloc]init];
    }
    return _APPShow;
}

- (void) UIchanged{
    self.PicBtn.hidden = true;
    [self.view addSubview:self.uploadbtn];
    [self.uploadbtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.PicBtn);
        make.bottom.mas_equalTo(self.view).mas_offset(-50);
        make.right.mas_equalTo(self.view).mas_offset(-40);
    }];
    [self.view addSubview:self.repicbtn];
    [self.repicbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-50);
        make.left.mas_equalTo(self.view).offset(40);
    }];
}

- (void) MakeUI{
    [self.view addSubview:self.PicBtn];
    [self.PicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).mas_offset(-50);
    }];
    [self.view addSubview:self.prompt];
    [self.prompt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(40);
    }];
    [self.view addSubview:self.APPShow];
    [self.APPShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.top.mas_equalTo(self.prompt).offset(30);
        make.bottom.mas_equalTo(self.PicBtn).offset(-40);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
    }];
}
- (UIButton*) uploadbtn{
    if(!_uploadbtn){
        _uploadbtn = [[UIButton alloc]init];
        [_uploadbtn setBackgroundColor:[UIColor colorWithRed:225/255.0 green:255/255.0 blue:255/233.0 alpha:1.0]];
        [_uploadbtn setTitle:@"上传分析" forState:UIControlStateNormal];
        [_uploadbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_uploadbtn.layer setBorderWidth:1.0f];
        _uploadbtn.layer.cornerRadius = 4;
        _uploadbtn.layer.masksToBounds = YES;
        [_uploadbtn addTarget:self action:@selector(uploadbtnclicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _uploadbtn;
}

- (UIButton*) repicbtn{
    if(!_repicbtn){
        _repicbtn = [[UIButton alloc]init];
        [_repicbtn setBackgroundColor:[UIColor colorWithRed:225/255.0 green:255/255.0 blue:255/233.0 alpha:1.0]];
        [_repicbtn setTitle:@"重新拍照" forState:UIControlStateNormal];
        [_repicbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_repicbtn.layer setBorderWidth:1.0f];
        _repicbtn.layer.cornerRadius = 4;
        _repicbtn.layer.masksToBounds = YES;
        [_repicbtn addTarget:self action:@selector(PicbtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _repicbtn;
}
- (UIButton*) PicBtn{
    if(!_PicBtn){
        _PicBtn = [[UIButton alloc]init];
        [_PicBtn setBackgroundColor:[UIColor colorWithRed:225/255.0 green:255/255.0 blue:255/233.0 alpha:1.0]];
//        [_PicBtn setBackgroundColor:[UIColor grayColor]]
        [_PicBtn setTitle:@"点击拍照" forState:UIControlStateNormal];
        [_PicBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_PicBtn setTitleEdgeInsets:[UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)]]
        [_PicBtn.layer setBorderWidth:1.0f];
        _PicBtn.layer.cornerRadius = 4;
        _PicBtn.layer.masksToBounds = YES;
        [_PicBtn addTarget:self action:@selector(PicbtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _PicBtn;
}
- (UILabel*) prompt{
    if(!_prompt){
        NSShadow * tempshaow = [[NSShadow alloc] init];
        tempshaow.shadowBlurRadius = 2;
        tempshaow.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.25];
        tempshaow.shadowOffset =CGSizeMake(0,1);
        
        _prompt = [[UILabel alloc] initWithFrame:CGRectZero];
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"拍一张苹果，测一下糖度" ];
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,string.length)];
        [string addAttribute:NSShadowAttributeName value:tempshaow range:NSMakeRange(0, string.length)];
        _prompt.numberOfLines = 0;
        _prompt.attributedText = string;
        _prompt.alpha = 1.0;
        _prompt.font = [UIFont systemFontOfSize:14];
        _prompt.textAlignment = NSTextAlignmentRight;
    }
    return _prompt;
}

@end
// 我们在
