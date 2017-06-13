//
//  ThumbnailViewController.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "CoordinatingController.h"

@interface ThumbnailViewController ()
{
    UINavigationItem *_navItem;
    ScribbleManager *_scribbleManager;
}

@end

@implementation ThumbnailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setupUI];
    
    // initialize the scribble manager
    _scribbleManager = [[ScribbleManager alloc] init];
    
    // show number of scribbles available
    NSInteger numberOfScribbles = _scribbleManager.numberOfScribbles;
    _navItem.title = [NSString stringWithFormat:numberOfScribbles > 1 ? @"%zd items" : @"%zd item", numberOfScribbles];
}

- (void)setupUI {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    _navItem = self.navigationItem;
    
    // set the table view's background
    // with a dark cloth texture image
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_texture"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    CGFloat numberOfPlaceholders = [ScribbleThumbnailCell numberOfPlaceHolders];
    NSInteger numberOfScribbles = _scribbleManager.numberOfScribbles;
    NSInteger numberOfRows = ceil(numberOfScribbles/numberOfPlaceholders);
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ScribbleThumbnailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[ScribbleThumbnailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = [UITableViewCellSelectionStyleNone];
    }
    
    // populate  thumbnails in each cell
    
    // get max number of thumbnail a thumbnail
    // cell can support
    NSInteger numberOfSupportedThumbnails = [ScribbleThumbnailCell numberOfPlaceHolders];
    
    // we can only add max numberOfSupportedThumbnails
    // at a time in each cell
    // e.g. numberOfSupportedThumbnails = 3
    // thumbnail index in the scribble manager is (row index *3) +0, +1, +2
    NSUInteger rowIndex = indexPath.row;
    NSInteger thumbnailIndex = rowIndex * numberOfSupportedThumbnails;
    NSInteger numberOfScribble = _scribbleManager.numberOfScribbles;
    for (NSInteger i = 0; i < numberOfSupportedThumbnails && (thumbnailIndex + i) < numberOfScribbles; ++i) {
        UIView *scribbleThumbnail = [_scribbleManager scribbleThumbnailViewAtIndex:thumbnailIndex + i];
        [cell addThumbnailView:scribbleThumbnail atIndex:i];
    }
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
