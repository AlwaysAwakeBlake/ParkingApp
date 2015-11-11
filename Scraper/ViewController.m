//
//  ViewController.m
//  Scraper
//
//  Created by Blake Mabe on 9/8/15.
//  Copyright (c) 2015 BlakeMabeApps. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@end

@implementation ViewController

@synthesize war, champ, space1, space2, lab1, lab2, heightCon, spaceCon, wnumberSpace, cnumberSpace, sectionSpace, box;

#define IS_IPHONE_5 ( [ [ UIScreen mainScreen ] bounds ].size.height == 568 )
#define IS_IPHONE_4 ( [ [ UIScreen mainScreen ] bounds ].size.height == 480 )
#define IS_IPHONE_6 ( [ [ UIScreen mainScreen ] bounds ].size.height == 667 )
#define IS_IPHONE_6PLUS ( [ [ UIScreen mainScreen ] bounds ].size.height == 736 )

- (void)viewDidLoad
{
    if(IS_IPHONE_5)
    {
        //Adjust Constraints
        spaceCon.constant = 30;
        heightCon.constant = 80;
        wnumberSpace.constant = 20;
        cnumberSpace.constant = 20;
        sectionSpace.constant = 15;

        //Adjust Fonts
        [war setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:120.0f]];
        [champ setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:120.0f]];
        [lab1 setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:44.0f]];
        [lab2 setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:44.0f]];

    }
    else if(IS_IPHONE_4)
    {
        //Adjust Constraints
        spaceCon.constant = 10;
        heightCon.constant = 60;
        wnumberSpace.constant = 10;
        cnumberSpace.constant = 10;
        sectionSpace.constant = 7;
    }
    else if(IS_IPHONE_6)
    {
        //Adjust Constraints
        heightCon.constant = 110;
        sectionSpace.constant = 62;
        spaceCon.constant = 100;
        wnumberSpace.constant = 30;
        cnumberSpace.constant = 30;

        //Adjust Fonts
        [war setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:136.0f]];
        [champ setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:136.0f]];
        [box setImage:[UIImage imageNamed: @"boxwithbreak.png"]];
    
    }
    else if(IS_IPHONE_6PLUS)
    {
        //Adjust Constraints
        heightCon.constant = 130;
        sectionSpace.constant = 95;
        spaceCon.constant = 100;
        wnumberSpace.constant = 30;
        cnumberSpace.constant = 30;
        
        //Adjust Fonts
        [war setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:136.0f]];
        [champ setFont:[UIFont fontWithName:@"TrajanPro-Regular" size:136.0f]];
        [box setImage:[UIImage imageNamed: @"boxwithbreak.png"]];
        
    }


    [super viewDidLoad];
    
   
    //Add Font Shadow
    war.layer.shadowColor = [[UIColor blackColor] CGColor];
    war.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    war.layer.shadowOpacity = 1.0f;
    war.layer.shadowRadius = 1.0f;
    
    //Add Font Shadow
    champ.layer.shadowColor = [[UIColor blackColor] CGColor];
    champ.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    champ.layer.shadowOpacity = 1.0f;
    champ.layer.shadowRadius = 1.0f;
    
    //Add Font Shadow
    space1.layer.shadowColor = [[UIColor blackColor] CGColor];
    space1.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    space1.layer.shadowOpacity = 1.0f;
    space1.layer.shadowRadius = 1.0f;
    
    //Add Font Shadow
    space2.layer.shadowColor = [[UIColor blackColor] CGColor];
    space2.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    space2.layer.shadowOpacity = 1.0f;
    space2.layer.shadowRadius = 1.0f;

    //Add Font Shadow
    lab1.layer.shadowColor = [[UIColor blackColor] CGColor];
    lab1.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    lab1.layer.shadowOpacity = 1.0f;
    lab1.layer.shadowRadius = 1.0f;
  
    //Add Font Shadow
    lab2.layer.shadowColor = [[UIColor blackColor] CGColor];
    lab2.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    lab2.layer.shadowOpacity = 1.0f;
    lab2.layer.shadowRadius = 1.0f;
    
    war.adjustsFontSizeToFitWidth = YES;
    war.numberOfLines = 0;
    champ.numberOfLines = 0;
    
     //Set Font Color
    [war setTextColor:[UIColor colorWithRed:(91/255.f) green:(176/255.f) blue:(62/255.f) alpha:1.0f]];
    [champ setTextColor:[UIColor colorWithRed:(91/255.f) green:(176/255.f) blue:(62/255.f) alpha:1.0f]];
    [space1 setTextColor:[UIColor colorWithRed:(91/255.f) green:(176/255.f) blue:(62/255.f) alpha:1.0f]];
    [space2 setTextColor:[UIColor colorWithRed:(91/255.f) green:(176/255.f) blue:(62/255.f) alpha:1.0f]];

    
    [self updateSpots];

    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                      selector: @selector(callAfterSixtySecond:) userInfo: nil repeats: YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) callAfterSixtySecond:(NSTimer*) t
{
    [self updateSpots];
}

-(void) updateSpots
{
    NSURL *url = [NSURL URLWithString:@"http://www.jmu.edu/cgi-bin/parking_get_sign_data.cgi"];
    NSString *webData= [NSString stringWithContentsOfURL:url];
    NSString *html = [url absoluteString];
    NSArray *contents = [webData componentsSeparatedByString:@"</Sign>"];
    NSArray *contents1 = [contents[1] componentsSeparatedByString:@"<Display>"];
    NSArray *contents2 = [contents1[1] componentsSeparatedByString:@"</Display>"];
    
    NSArray *contents3 = [contents[7] componentsSeparatedByString:@"<Display>"];
    NSArray *contents4 = [contents3[1] componentsSeparatedByString:@"</Display>"];
    
    if ([war.text isEqualToString:@"Full"])
    {
        [war setTextColor:[UIColor colorWithRed:(255/255.f) green:(0/255.f) blue:(0/255.f) alpha:1.0f]];
        space1.hidden = TRUE;
    }
    if ([champ.text isEqualToString:@"Full"])
    {
        [champ setTextColor:[UIColor colorWithRed:(255/255.f) green:(0/255.f) blue:(0/255.f) alpha:1.0f]];
         space2.hidden = TRUE;
    }
    
    
    war.text = [contents2[0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    champ.text = [contents4[0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
