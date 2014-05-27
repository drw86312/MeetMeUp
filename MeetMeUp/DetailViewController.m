//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by David Warner on 5/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *hostGroupLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = self.dictionaryFromSourceView[@"venue"][@"name"];
    self.rsvpLabel.text = [NSString stringWithFormat:@"%@", self.dictionaryFromSourceView[@"yes_rsvp_count"]];
    self.hostGroupLabel.text = self.dictionaryFromSourceView[@"group"][@"name"];
    self.descriptionLabel.text = self.dictionaryFromSourceView[@"description"];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.urlString = self.dictionaryFromSourceView[@"event_url"];
}



@end
