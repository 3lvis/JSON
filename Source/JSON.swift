import Foundation

public class JSON {
  public class func from(fileName: String) -> (result: AnyObject?, error: NSError?) {
    return from(fileName, bundle: NSBundle.mainBundle())
  }

  public class func from(fileName: String, bundle: NSBundle) -> (result: AnyObject?, error: NSError?) {
    var tuple: (AnyObject?, NSError?)
    if let filePath = bundle.pathForResource(fileName.stringByDeletingPathExtension, ofType: fileName.pathExtension) {
      if let data = NSData(contentsOfFile: filePath) {
        tuple = data.toJSON()
      }
    }

    return tuple
  }
}

extension NSData {
  public func toJSON() -> (result: AnyObject?, error: NSError?) {
    var error: NSError?
    let JSON: AnyObject? = NSJSONSerialization.JSONObjectWithData(self, options: .allZeros, error: &error)

    return (JSON, error)
  }
}
