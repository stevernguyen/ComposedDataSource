//
//  ComposedDataSource.m
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import "ComposedDataSourceTableView.h"

const NSString *KEY_DATASOURCE = @"KEY_DATASOURCE";
const NSString *KEY_SECTION    = @"KEY_SECTION";

@interface ComposedDataSourceTableView ()

// <GlobalSection, (DataSource, LocalSection)
@property (nonatomic, strong) NSMutableArray *dataSourceIndex;

@end

@implementation ComposedDataSourceTableView

- (instancetype)init
{
    if (self = [super init]) {
        self.dataSourceIndex = [NSMutableArray new];
    }
    return self;
}

#pragma mark - private
- (DataSourceTableView*)dataSourceAtSection:(NSInteger)section
{
    id object = self.dataSourceIndex[section];
    DataSourceTableView *dataSource = (DataSourceTableView*)[object objectForKey:KEY_DATASOURCE];
    return dataSource;
}

- (NSInteger)localSectionAtSection:(NSInteger)section
{
    // get datasource + localsection
    id object = self.dataSourceIndex[section];
    NSInteger localSection = [[object objectForKey:KEY_SECTION] integerValue];
    return localSection;
}

- (NSDictionary*)createDataSource:(DataSourceTableView*)dataSource localsection:(NSInteger)localsection
{
    return @{KEY_DATASOURCE:dataSource,
             KEY_SECTION:@(localsection)};
}

#pragma mark - public
- (void)addDataSource:(DataSourceTableView*)dataSource
{
    // add object to source
    NSMutableArray *temp = [self.dataSources mutableCopy];
    if (!temp) {
        temp = [NSMutableArray new];
    }
    
    [temp addObject:dataSource];
    
    // set source new
    self.dataSources = [NSArray arrayWithArray:temp];
}

- (void)removeDataSource:(DataSourceTableView*)dataSource
{
    NSInteger index = [self.dataSources indexOfObject:dataSource];
    if (index != NSNotFound) {
        // remove object in source
        NSMutableArray *temp = [self.dataSources mutableCopy];
        [temp removeObjectAtIndex:index];
        
        // set source new
        self.dataSources = [NSArray arrayWithArray:temp];
    }
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:indexPath.section];
    NSInteger localSection = [self localSectionAtSection:indexPath.section];
    
    // create indexPath
    NSIndexPath *localIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:localSection];
   
    return [dataSource heightForRowAtIndexPath:localIndexPath];
}

- (void)selectRowAtIndexPath:(NSIndexPath*)indexPath
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:indexPath.section];
    NSInteger localSection = [self localSectionAtSection:indexPath.section];
    
    // create indexPath
    NSIndexPath *localIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:localSection];
    
    return [dataSource selectRowAtIndexPath:localIndexPath];
}

- (NSString*)titleForHeaderInSection:(NSInteger)section
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:section];
    
    return [dataSource titleForHeaderInSection:section];
}

- (NSString*)titleForFooterInSection:(NSInteger)section
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:section];
    
    return [dataSource titleForFooterInSection:section];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberOfSections = 0;
    NSInteger dataSourcesCount = [self.dataSources count];
    
    for (NSInteger i=0; i<dataSourcesCount; i++) {
        NSInteger dataSourceSections = 1;
        DataSourceTableView *dataSource = self.dataSources[i];
        
        if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
            dataSourceSections = [dataSource numberOfSectionsInTableView:tableView];
        }
        
        NSInteger localSection = 0;
        
        while (dataSourceSections > 0) {
            self.dataSourceIndex[numberOfSections] = [self createDataSource:self.dataSources[i]
                                                               localsection:localSection];
            
            ++localSection;
            ++numberOfSections;
            --dataSourceSections;
        }
    }
    
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:section];
    NSInteger localSection = [self localSectionAtSection:section];
    
    return [dataSource tableView:tableView numberOfRowsInSection:localSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:indexPath.section];
    NSInteger localSection = [self localSectionAtSection:indexPath.section];
    
    // create indexPath
    NSIndexPath *localIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:localSection];
    
    return [dataSource tableView:tableView cellForRowAtIndexPath:localIndexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:section];
    NSInteger localSection = [self localSectionAtSection:section];
    
    return [dataSource titleForHeaderInSection:localSection];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // get datasource + localsection
    DataSourceTableView *dataSource = [self dataSourceAtSection:section];
    NSInteger localSection = [self localSectionAtSection:section];
    
    return [dataSource titleForFooterInSection:localSection];
}

@end