//
//  ViewController.h
//  Scraper
//
//  Created by Blake Mabe on 9/8/15.
//  Copyright (c) 2015 BlakeMabeApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *champ;
@property (weak, nonatomic) IBOutlet UILabel *war;
@property (weak, nonatomic) IBOutlet UILabel *space1;
@property (weak, nonatomic) IBOutlet UILabel *space2;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spaceCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cnumberSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wnumberSpace;

@property (weak, nonatomic) IBOutlet UIImageView *box;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sectionSpace;

@end

