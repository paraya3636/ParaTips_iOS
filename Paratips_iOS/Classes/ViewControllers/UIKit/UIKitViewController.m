//
//  UIKitViewController.m
//  ParaTips
//
//  Created by miura on 2014/09/29.
//  Copyright (c) 2014年 Paradrops. All rights reserved.
//

#import "UIKitViewController.h"

NSString* const CELL_ID_UIKIT = @"CELL_ID_UIKIT";
NSString* const SEGUE_ID_SHOW_UITABLEVIEW = @"SEGUE_ID_SHOW_UITABLEVIEW";

@interface UIKitViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSMutableArray* dataSourceArray;

@end

@implementation UIKitViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self
     setDataSourceArray:
     [NSMutableArray arrayWithObjects:@"UITableView",
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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_UIKIT];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CELL_ID_UIKIT];
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
    [self performSegueWithIdentifier:SEGUE_ID_SHOW_UITABLEVIEW sender:self];
}

@end
