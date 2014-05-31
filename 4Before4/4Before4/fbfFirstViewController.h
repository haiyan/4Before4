//
//  fbfFirstViewController.h
//  4Before4
//
//  Created by Haiyan Zhang on 30/05/2014.
//  Copyright (c) 2014 Haiyan Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fbfFirstViewController : UIViewController <UINavigationControllerDelegate, UINavigationControllerDelegate>{
    NSDate *databaseDate;
    NSTimer *timer;
    UIImageView* currPicker;
}

@property (weak, nonatomic) IBOutlet UILabel *txtCountdown;
@property(nonatomic, retain) NSDate *databaseDate;

@property (weak, nonatomic) IBOutlet UIButton *Button1;
@property (weak, nonatomic) IBOutlet UIButton *Button2;
@property (weak, nonatomic) IBOutlet UIButton *Button3;
@property (weak, nonatomic) IBOutlet UIButton *Button4;
@property (weak, nonatomic) IBOutlet UIImageView *Image1;
@property (weak, nonatomic) IBOutlet UIImageView *Image2;
@property (weak, nonatomic) IBOutlet UIImageView *Image3;
@property (weak, nonatomic) IBOutlet UIImageView *Image4;

@end
