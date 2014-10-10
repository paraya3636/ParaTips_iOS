//
//  PDUIKitViewController.m
//  ParaTips
//
//  Created by miura on 2014/09/29.
//  Copyright (c) 2014年 Paradrops. All rights reserved.
//

#import "PDUIKitViewController.h"

NSString* const CELL_ID_PDUIKIT = @"CELL_ID_PDUIKIT";

NSString* const SEGUE_ID_SHOW_PDUITABLE_VIEWCONTROLLER = @"SEGUE_ID_SHOW_PDUITABLE_VIEWCONTROLLER";
NSString* const SEGUE_ID_SHOW_PDUITABLECELL_VIEWCONTROLLER = @"SEGUE_ID_SHOW_PDUITABLECELL_VIEWCONTROLLER";

@interface PDUIKitViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray* dataSourceArray;

@end

@implementation PDUIKitViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setDataSourceArray:[NSMutableArray arrayWithObjects:
                              @"UITableView",
                              @"UITableViewCell",
                              nil]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_PDUIKIT];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CELL_ID_PDUIKIT];
    }
    
    [self updateCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSString* title = [self.dataSourceArray objectAtIndex:[indexPath row]];
    [cell.textLabel setText:title];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            [self performSegueWithIdentifier:SEGUE_ID_SHOW_PDUITABLE_VIEWCONTROLLER sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:SEGUE_ID_SHOW_PDUITABLECELL_VIEWCONTROLLER sender:self];
            break;
        default:
            break;
    }
}

@end
