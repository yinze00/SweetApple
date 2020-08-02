//
//  UserInfo.h
//  SweetApple
//
//  Created by yinze on 2020/8/2.
//  Copyright © 2020 yinze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

@property(nonatomic,strong)NSString* username;
@property(nonatomic,strong)UIImage * usericon;
@property(nonatomic,strong)NSString* accesstoken;

@end

NS_ASSUME_NONNULL_END
