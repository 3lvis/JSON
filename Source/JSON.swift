import Foundation

class JSON {
  class func from(fileName: String) -> (result: NSObject?, error: NSError?) {
    return from(fileName, bundle: NSBundle.mainBundle())
  }

  class func from(fileName: String, bundle: NSBundle) -> (result: NSObject?, error: NSError?) {
    var error: NSError?
    var result: NSObject?
    if let filePath = bundle.pathForResource(fileName.stringByDeletingPathExtension, ofType: fileName.pathExtension) {
      if let data: NSData = NSData(contentsOfFile: filePath) {
        result = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: &error) as? NSObject
      }
    }

    return (result, error)
  }
}

extension NSObject {
  func prettyDescription() -> String? {
    var pretty: String?
    var error: NSError?
    if let data = NSJSONSerialization.dataWithJSONObject(self, options: .PrettyPrinted, error: &error) {
      pretty = NSString(data: data, encoding: NSUTF8StringEncoding) as? String
    }

    return pretty
  }

  func prettyPrint() {
    if let pretty = self.prettyDescription() {
      println(pretty)
    }
  }
}
