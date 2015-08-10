//
//  DataSource.h
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct DataSourceConstants {
    __unsafe_unretained NSString * const cellIdentifier;
    CGFloat const cellHeight;
};

@interface DataSourceTableView : NSObject <UITableViewDataSource>
{
    BOOL shouldDisplayDefaultTitles;
}

- (NSString*)titleForHeaderInSection:(NSInteger)section;
- (NSString*)titleForFooterInSection:(NSInteger)section;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath*)indexPath;
- (void)selectRowAtIndexPath:(NSIndexPath*)indexPath;

@end
