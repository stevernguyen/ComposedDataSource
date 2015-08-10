//
//  ShopItemListDataSource.m
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import "ShopItemListDataSource.h"
#import "ShopItemCell.h"

const struct DataSourceConstants ShopItemConstants = {
    .cellIdentifier = @"shopItemCellIdentifier",
    .cellHeight = 75.f
};

@implementation ShopItemListDataSource

- (instancetype)init
{
    if (self = [super init]) {
        shouldDisplayDefaultTitles = YES;
    }
    return self;
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ShopItemConstants.cellHeight;
}

- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopItem* item = self.items[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:item.name message:item.details delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (NSString *)titleForHeaderInSection:(NSInteger)section
{
    return @"Shop items";
}

- (NSString *)titleForFooterInSection:(NSInteger)section
{
    return @"Shop items footer title";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ShopItemConstants.cellIdentifier];
    ShopItem* item = self.items[indexPath.row];
    
    cell.cnameLabel.text = item.name;
    cell.ctitleLabel.text = item.details;
    
    return cell;
}

@end
