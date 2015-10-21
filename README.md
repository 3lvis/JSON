# JSON

[![CI Status](http://img.shields.io/travis/3lvis/JSON.svg?style=flat)](https://travis-ci.org/3lvis/JSON)
[![Version](https://img.shields.io/cocoapods/v/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![License](https://img.shields.io/cocoapods/l/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![Platform](https://img.shields.io/cocoapods/p/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)

This library helps you dealing with `NSJSONSerialization`. It has simple methods to get a JSON object from a file and converting NSData into a JSON object.

## Usage

## JSON Object from NSData

```swift
var response: NSURLResponse?
let request = NSURLRequest(URL: NSURL(string: "http://httpbin.org/get")!)
let data: NSData?
data = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
let JSON = try! data!.toJSON() as! [String : AnyObject]
let url = JSON["url"] as! String
XCTAssertEqual(url, "http://httpbin.org/get")
```

### JSON Object from file

**For files in the main bundle:**

```swift
import JSON

var users: AnyObject?
do {
    users = try JSON.from("users.json")
} catch {
    // Handle error
}
```

**For files in in other bundles (for example Tests file bundle):**
```swift
import JSON

var users: AnyObject?
do {
    users = try JSON.from("users.json", bundle: NSBundle(forClass: Tests.self))
} catch {
    // Handle error
}
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
