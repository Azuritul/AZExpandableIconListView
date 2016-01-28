# AZExpandableIconListView

[![CI Status](http://img.shields.io/travis/Azuritul/AZExpandableIconListView.svg?style=flat)](https://travis-ci.org/Azuritul/AZExpandableIconListView)
[![Version](https://img.shields.io/cocoapods/v/AZExpandableIconListView.svg?style=flat)](http://cocoapods.org/pods/AZExpandableIconListView)
[![License](https://img.shields.io/cocoapods/l/AZExpandableIconListView.svg?style=flat)](http://cocoapods.org/pods/AZExpandableIconListView)
[![Platform](https://img.shields.io/cocoapods/p/AZExpandableIconListView.svg?style=flat)](http://cocoapods.org/pods/AZExpandableIconListView)
[![Language](https://img.shields.io/badge/swift-2.1-orange.svg)](http://swift.org)

An expandable/collapsible UIView that holds an array of UIImageView. Something like accordion.  An interesting practice with auto layout and animation.

## Screenshots
![expandable](https://cloud.githubusercontent.com/assets/879197/12646401/2b39c754-c613-11e5-9b87-c5ec4084fbbb.gif)

## Requirements
- iOS 8 or above
- Xcode 7 or above
- Swift 2.1

## Installation
To run the example project, clone the repo with `git clone https://github.com/Azuritul/AZExpandableIconListView.git`, and run `pod install` from the Example directory first.

## Usage
Initialize the view with frame and an array of images, for example:
```Swift
let expandable = AZExpandableIconListView(frame: CGRectMake(4, 30, UIScreen.mainScreen().bounds.size.width - 20, 70), images: [image1, image2, image3])
view.addSubview(expandable)
```
Notice that the width and height of the icons in the view would always be 80% of the containing view's height.

### Configurable options
Currently AZDropdownMenu can be customized with the following properties. More will come in the future.

- `imageSpacing` The space between icons. Default is 4.
- `onExpanded` The method to be called when the menu is expanded. Default is null.
- `onCollapsed` The method to be called when the menu is collapsed. Default is null.

## Installation

AZExpandableIconListView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod 'AZExpandableIconListView'
```
## Version

- 0.1.0
   - Initial version

## Author

Chris Wu (Azuritul), azuritul@gmail.com

## License

AZExpandableIconListView is available under the MIT license. See the LICENSE file for more info.
