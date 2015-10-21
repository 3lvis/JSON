import Foundation

public enum ParsingError: ErrorType {
  case NotFound, Failed
}

public class JSON {
  public class func from(fileName: String, bundle: NSBundle = NSBundle.mainBundle()) throws -> AnyObject? {
    var JSON: AnyObject?

    guard let url = NSURL(string: fileName), filePath = bundle.pathForResource(url.URLByDeletingPathExtension?.absoluteString, ofType: url.pathExtension) else { throw ParsingError.NotFound }

    guard let data = NSData(contentsOfFile: filePath) else { throw ParsingError.Failed }

    JSON = try data.toJSON()

    return JSON
  }
}

extension NSData {
  public func toJSON() throws -> AnyObject? {
    var JSON: AnyObject?
    do {
      JSON = try NSJSONSerialization.JSONObjectWithData(self, options: [])
    } catch {
      throw ParsingError.Failed
    }

    return JSON
  }
}
