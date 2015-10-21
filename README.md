# JSON

[![CI Status](http://img.shields.io/travis/3lvis/JSON.svg?style=flat)](https://travis-ci.org/3lvis/JSON)
[![Version](https://img.shields.io/cocoapods/v/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![License](https://img.shields.io/cocoapods/l/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![Platform](https://img.shields.io/cocoapods/p/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)

This library helps you dealing with `NSJSONSerialization`. It has simple methods to get a JSON object from a file and converting NSData into a JSON object.

## JSON Object from NSData

```swift
let request = NSURLRequest(URL: NSURL(string: "http://httpbin.org/get")!)
NSURLSession.sharedSession().dataTaskWithRequest(request) { data, _, error in
    let JSON = try! data!.toJSON() as! [String : AnyObject]
    print(JSON)
    
    expectation.fulfill()
}.resume()
```

```json
{
  "args": {}, 
  "headers": {
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp;q=0.8", 
    "Accept-Encoding": "gzip, deflate, sdch", 
    "Accept-Language": "en-US,en;q=0.8,es;q=0.6,nb;q=0.4", 
    "Host": "httpbin.org", 
    "Upgrade-Insecure-Requests": "1", 
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36"
  }, 
  "origin": "185.55.105.254", 
  "url": "http://httpbin.org/get"
}
*/
```

## JSON Object from file

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
