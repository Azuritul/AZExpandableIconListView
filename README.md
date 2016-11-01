# AZExpandableIconListView

[![CI Status](http://img.shields.io/travis/Azuritul/AZExpandableIconListView.svg?style=flat)](https://travis-ci.org/Azuritul/AZExpandableIconListView)
[![Version](https://img.shields.io/cocoapods/v/AZExpandableIconListView.svg?style=flat)](http://cocoapods.org/pods/AZExpandableIconListView)
[![License](https://img.shields.io/cocoapods/l/AZExpandableIconListView.svg?style=flat)](http://cocoapods.org/pods/AZExpandableIconListView)
[![Platform](https://img.shields.io/cocoapods/p/AZExpandableIconListView.svg?style=flat)](http://cocoapods.org/pods/AZExpandableIconListView)
[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](http://swift.org)

An expandable/collapsible UIView that holds an array of UIImageView. Something like accordion.  An interesting practice with auto layout and animation.

## Screenshots
![expandable](https://cloud.githubusercontent.com/assets/879197/12738681/49bc442c-c9a6-11e5-976e-68650cbe4af2.gif)

## Requirements
- iOS 9 or above
- Xcode 8 or above
- Swift 3

## Demo Project
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
- 0.2.0
   - Updated for Swift 3
- 0.1.1
   - Updated README
- 0.1.0
   - Initial version

## Credit

- Avatar icon used in README's screenshot is [Designed by Skydesign - Freepik.com](http://www.freepik.com/free-photos-vectors/people)

## Author

Chris Wu (Azuritul), azuritul@gmail.com

## License

AZExpandableIconListView is available under the MIT license. See the LICENSE file for more info.
