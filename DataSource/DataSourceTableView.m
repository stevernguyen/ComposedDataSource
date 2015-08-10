//
//  DataSource.m
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import "DataSourceTableView.h"

@implementation DataSourceTableView

#pragma mark - public
- (NSString*)titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSString*)titleForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 0.f;
}

- (void)selectRowAtIndexPath:(NSIndexPath*)indexPath
{
    // do not nothing
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (shouldDisplayDefaultTitles) {
        return [self titleForHeaderInSection:section];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (shouldDisplayDefaultTitles) {
        return [self titleForFooterInSection:section];
    }
    return nil;
}

@end
