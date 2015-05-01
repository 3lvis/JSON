import Foundation

class JSON {
  class func from(fileName: String) -> (result: AnyObject?, error: NSError?) {
    return from(fileName, bundle: NSBundle.mainBundle())
  }

  class func from(fileName: String, bundle: NSBundle) -> (result: AnyObject?, error: NSError?) {
    var error: NSError?
    var result: AnyObject?
    if let filePath = bundle.pathForResource(fileName.stringByDeletingPathExtension, ofType: fileName.pathExtension) {
      if let data: NSData = NSData(contentsOfFile: filePath) {
        result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error)
      }
    }

    return (result, error)
  }
}
