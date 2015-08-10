//
//  ComposedDataSource.h
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import "DataSourceTableView.h"

@interface ComposedDataSourceTableView : DataSourceTableView

@property (nonatomic, strong) NSArray *dataSources;

@end
