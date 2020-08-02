//
//  PictureViewController.h
//  SweetApple
//
//  Created by yinze on 2020/8/2.
//  Copyright © 2020 yinze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"
NS_ASSUME_NONNULL_BEGIN

@class PictureViewController;

@protocol vcPictureDelegate <NSObject>

- (void) additemvc:(PictureViewController *) c didFinishenteringitem:(UserInfo*)item;

@end


@interface PictureViewController : UIViewController
@property (nonatomic, weak) id <vcPictureDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
