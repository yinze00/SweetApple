//
//  UserInfo.m
//  SweetApple
//
//  Created by yinze on 2020/8/2.
//  Copyright © 2020 yinze. All rights reserved.
//

#import "UserInfo.h"




@implementation UserInfo

-(id)init{
    self.usericon = [[UIImage alloc]init];
    self.username = @"yinze";
    self.accesstoken = @":sdfsdf";
    return self;
}

-(id)initWithName:(NSString*)uname
             icon:(UIImage*)uimg
          actoken:(NSString*)utoken{
    self.username = uname;
    self.usericon = uimg;
    self.accesstoken = utoken;
    return self;
}


@end
