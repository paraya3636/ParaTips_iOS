//
//  PDIPodLibraryViewController.m
//  ParaTips
//
//  Created by miura on 2014/09/29.
//  Copyright (c) 2014年 Paradrops. All rights reserved.
//

#import "PDIPodLibraryViewController.h"

NSString* const CELL_ID_PDIPODLIBRARY = @"CELL_ID_PDIPODLIBRARY";

//NSString* const SEGUE_ID_SHOW_PDIPODLIBRARY_VIEWCONTROLLER = @"SEGUE_ID_SHOW_PDIPODLIBRARY_VIEWCONTROLLER";

@interface PDIPodLibraryViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSMutableArray* dataSourceArray;

@end

@implementation PDIPodLibraryViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setDataSourceArray:[NSMutableArray arrayWithObjects:
                              @"Show MediaItemPicker",
                              @"Get playList",
                              @"Get artists",
                              @"Get albums",
                              @"Get all music",
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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_PDIPODLIBRARY];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CELL_ID_PDIPODLIBRARY];
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
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        default:
            break;
    }
    
    
//    [self performSegueWithIdentifier:SEGUE_ID_SHOW_PDIPODLIBRARY_VIEWCONTROLLER sender:self];
}

@end
