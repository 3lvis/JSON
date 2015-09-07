import Foundation

public class JSON {
  public class func from(fileName: String) -> (result: AnyObject?, error: NSError?) {
    return from(fileName, bundle: NSBundle.mainBundle())
  }

  public class func from(fileName: String, bundle: NSBundle) -> (result: AnyObject?, error: NSError?) {
    var tuple: (AnyObject?, NSError?)
    let url = NSURL(string: fileName)
    if let filePath = bundle.pathForResource(url?.URLByDeletingPathExtension?.absoluteString, ofType: url?.pathExtension) {
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
    let JSON: AnyObject?
    do {
      JSON = try NSJSONSerialization.JSONObjectWithData(self, options: [])
    } catch let error1 as NSError {
      error = error1
      JSON = nil
    }

    return (JSON, error)
  }
}
