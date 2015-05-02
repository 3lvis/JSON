import Foundation

class JSON {
  class func from(fileName: String) -> (result: NSObject?, error: NSError?) {
    return from(fileName, bundle: NSBundle.mainBundle())
  }

  class func from(fileName: String, bundle: NSBundle) -> (result: NSObject?, error: NSError?) {
    var tuple: (NSObject?, NSError?)
    if let filePath = bundle.pathForResource(fileName.stringByDeletingPathExtension, ofType: fileName.pathExtension) {
      if let data = NSData(contentsOfFile: filePath) {
        tuple = data.toJSON()
      }
    }

    return tuple
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

extension NSData {
  func toJSON() -> (result: NSObject?, error: NSError?) {
    var error: NSError?
    let JSON = NSJSONSerialization.JSONObjectWithData(self, options: .allZeros, error: &error) as? NSObject

    return (JSON, error)
  }
}
