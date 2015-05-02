import Foundation
import XCTest

class Tests: XCTestCase {
  // MARK: - from

  func testArrayJSONFromFileNamed() {
    var success = false

    let (result: AnyObject?, error) = JSON.from("simple_array.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let result = result as? [[String : AnyObject]] {
      let compared = [["id" : 1, "name" : "Hi"]]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testDictionaryJSONFromFileNamed() {
    var success = false

    let (result: AnyObject?, error) = JSON.from("simple_dictionary.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let result = result as? [String : NSObject] {
      let compared = ["id" : 1, "name" : "Hi"]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  // MARK: - to JSON

  func testToJSON() {
    var connectionError: NSError?
    var response: NSURLResponse?
    let request = NSURLRequest(URL: NSURL(string: "http://httpbin.org/get")!)
    let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &connectionError)
    let result = data!.toJSON()
    let JSON = result.result as! [String : AnyObject]
    let url = JSON["url"] as! String
    XCTAssertEqual(url, "http://httpbin.org/get")
  }
}
