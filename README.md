# JSON

[![Version](https://img.shields.io/cocoapods/v/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![License](https://img.shields.io/cocoapods/l/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)
[![Platform](https://img.shields.io/cocoapods/p/JSON.svg?style=flat)](http://cocoadocs.org/docsets/JSON)

This library helps you dealing with `NSJSONSerialization`. It has simple methods to convert NSData into a JSON object and to get a JSON object from a file.

## JSON Object from NSData

If converting the NSData to JSON fails, you'll get a `ParsingError.Failed` error.

```swift
guard let url = NSURL(string: "http://httpbin.org/get") else { return }
let request = NSURLRequest(URL: url)
NSURLSession.sharedSession().dataTaskWithRequest(request) { data, _, error in
    do {
        let JSON = try data?.toJSON() as? [String : Any]
        print(JSON)
    } catch {
        // Handle error
    }
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
  "origin": "000.00.000.000", 
  "url": "http://httpbin.org/get"
}
*/
```

## JSON Object from file

If parsing the JSON fails, you'll get a `ParsingError.Failed` error. If the file is not found you'll get a `ParsingError.NotFound` error.

**For files in the main bundle:**

```swift
import JSON

var users: Any?
do {
    users = try JSON.from("users.json")
} catch {
    // Handle error
}
```

**For files in in other bundles (for example Tests file bundle):**

```swift
import JSON

var users: Any?
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
