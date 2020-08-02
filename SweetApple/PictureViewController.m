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
@property(nonatomic,strong) ZLPhotoActionSheet * ZLpic;
@property(nonatomic,strong) UIImageView* show;
@property(nonatomic,strong) UIButton* picbtn;
@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"主d面";
    [self makeui];
    
}

- (void)makeui{
    [self.view addSubview:self.picbtn];
    [self.picbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-40);
    }];
    [self.view addSubview:self.show];
    [self.show mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(20);
    }];
}

- (ZLPhotoActionSheet*)ZLpic{
    if(_ZLpic){
        _ZLpic = [[ZLPhotoActionSheet alloc]init];
        _ZLpic.configuration.maxSelectCount = 5;
        _ZLpic.configuration.maxPreviewCount = 20;
        _ZLpic.sender = self;
    }
    return _ZLpic;
}

-(UIButton*)picbtn{
    if(!_picbtn){
        _picbtn = [[UIButton alloc ]init];
//        _picbtn.titleLabel = [[UILabel alloc]init];
        [_picbtn setBackgroundColor:[UIColor blueColor]];
        [_picbtn setTitle:@"拍照" forState:UIControlStateNormal];
        [_picbtn addTarget:self action:@selector(picbtnclicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _picbtn;
}

-(UIImageView*)show{
    if(!_show){
        _show = [[UIImageView alloc]init];
    }
    return _show;
}

-(void)picbtnclicked{
    [self.ZLpic showPreviewAnimated:YES];
    // 直接调用相机
    ZLCustomCamera *camera = [[ZLCustomCamera alloc] init];


    camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
        // 自己需要在这个地方进行图片或者视频的保存
        NSLog(@"dsasdfasdfasdfa");
        [self.show setImage:image];
    };

    [self showDetailViewController:camera sender:nil];

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
