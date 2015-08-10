//
//  ShopItem.h
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSDate   *expirationDate;
@property (nonatomic, assign) double   *price;

@end
