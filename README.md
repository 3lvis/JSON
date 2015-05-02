# JSON

[![CI Status](http://img.shields.io/travis/3lvis/JSON.svg?style=flat)](https://travis-ci.org/3lvis/JSON)
[![Version](https://img.shields.io/cocoapods/v/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![License](https://img.shields.io/cocoapods/l/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![Platform](https://img.shields.io/cocoapods/p/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)

## Usage

```swift
import JSON

// Looks for your file in the main bundle
let (result: AnyObject?, error) = JSON.from("users.json")

let (result: AnyObject?, error) = JSON.from("users.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
```

## Installation

**JSON** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JSON'
```

## Author

Elvis Nuñez, [@3lvis](https://twitter.com/3lvis)

## License

**JSON** is available under the MIT license. See the LICENSE file for more info.
