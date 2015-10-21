import Foundation

public enum ParsingError: ErrorType {
  case NotFound, Failed
}

public class JSON {
  public class func from(fileName: String, bundle: NSBundle = NSBundle.mainBundle()) throws -> AnyObject? {
    var JSON: AnyObject? = nil
    let url = NSURL(string: fileName)
    if let filePath = bundle.pathForResource(url?.URLByDeletingPathExtension?.absoluteString, ofType: url?.pathExtension) {
      if let data = NSData(contentsOfFile: filePath) {
        do {
          JSON = try data.toJSON()
        } catch {
          throw ParsingError.Failed
        }
      }
    } else {
      throw ParsingError.NotFound
    }

    return JSON
  }
}

extension NSData {
  public func toJSON() throws -> AnyObject? {
    var JSON: AnyObject? = nil
    do {
      JSON = try NSJSONSerialization.JSONObjectWithData(self, options: [])
    } catch {
      throw ParsingError.Failed
    }

    return JSON
  }
}
