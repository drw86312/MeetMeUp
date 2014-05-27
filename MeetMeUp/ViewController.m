//
//  ViewController.m
//  MeetMeUp
//
//  Created by David Warner on 5/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSDictionary *eventsDictionary;
@property NSArray *eventsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{

    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=351e376f5a6047102e70752b32c373b"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [super viewDidLoad];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        self.eventsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        self.eventsArray = [self.eventsDictionary objectForKey:@"results"];
        [self.tableView reloadData];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    NSDictionary *dictionary = [self.eventsArray objectAtIndex:indexPath.row];

    cell.textLabel.text = dictionary[@"venue"][@"name"];
    cell.detailTextLabel.text = dictionary[@"venue"][@"address_1"];

    return cell;
}








@end
