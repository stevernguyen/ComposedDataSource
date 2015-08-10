//
//  ViewController.m
//  ComposedDataSource
//
//  Created by Quynh Nguyen Van on 8/10/15.
//  Copyright (c) 2015 Quynh Nguyen Van. All rights reserved.
//

#import "ViewController.h"
#import "ShopItemListDataSource.h"
#import "ComposedDataSourceTableView.h"

@interface ViewController ()<UITableViewDelegate>
{
    ShopItemListDataSource *shopDataSource1;
    ShopItemListDataSource *shopDataSource2;
    
    ComposedDataSourceTableView *composedDataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    shopDataSource1 = [ShopItemListDataSource new];
    
    // Shop items
    ShopItem* shopItem1 = [ShopItem new];
    
    shopItem1.name = @"Donuts";
    shopItem1.details = @"Tasty food";
    
    ShopItem* shopItem2 = [ShopItem new];
    
    shopItem2.name = @"Lemon Yogurt";
    shopItem2.details = @"King's deserve";
    
    shopDataSource1.items = @[shopItem1, shopItem2];
    
    
    shopDataSource2 = [ShopItemListDataSource new];
    
    // Shop items
    ShopItem* shopItem3 = [ShopItem new];
    
    shopItem3.name = @"Nguyen";
    shopItem3.details = @"Van Quynh";
    
    ShopItem* shopItem4 = [ShopItem new];
    
    shopItem4.name = @"Test 123";
    shopItem4.details = @"ds;ksdks";
    
    ShopItem* shopItem5 = [ShopItem new];
    
    shopItem5.name = @";lsdks;ds";
    shopItem5.details = @"23rml";
    
    shopDataSource2.items = @[shopItem3, shopItem4,shopItem5];
    
    
//    self.tableView.dataSource = shopDataSource;
    
    composedDataSource = [ComposedDataSourceTableView new];
    composedDataSource.dataSources = @[shopDataSource1, shopDataSource2];
    self.tableView.dataSource = composedDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [composedDataSource heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [composedDataSource selectRowAtIndexPath:indexPath];
//    [shopDataSource selectRowAtIndexPath:indexPath];
}

@end
