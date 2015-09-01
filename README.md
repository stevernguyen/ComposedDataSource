# [ComposedDataSource] 
Convert switf (source: https://github.com/ortuman/ComposedDataSource) to objective-C

ComposedDataSource is a simple library built on UIKit framework which allows you to create complex table layouts by decomposing them into smaller and more manageable elements, encouraging modularity and reusability.

## Usage

Example app is included with the project. Here is one simple usage pattern:

```swift
// create a composed data source derived from a customer and stock list
let stockItemListDataSource = StockItemListDataSource(stockItems)
let customerListDataSource = CustomerListDataSource(customers)

let composedDataSource = ComposedDataSource()

composedDataSource.dataSources = [stockItemListDataSource, customerListDataSource]

self.tableView.dataSource = composedDataSource
```
And here is an example of a more complex composition:

```swift
let composedDataSource1 = ...
let composedDataSource2 = ...

let pictureListDataSource = PictureListDataSource(pictures)

let composedDataSource3 = ComposedDataSource()

composedDataSource3.dataSources = [composedDataSource1, pictureListDataSource, composedDataSource2]

self.tableView.dataSource = composedDataSource3
```

Requirements
---------------------

* iOS 7.0 and above

Contact
-------

If you are using ComposedDataSource in your project and have any suggestion or question:

Miguel Angel Ortuño, <ortuman@gmail.com>

[@ortuman](http://twitter.com/ortuman)

## Licence

ComposedDataSource is released under a BSD License. See LICENSE file for details.
