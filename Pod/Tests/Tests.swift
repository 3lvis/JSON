import Foundation
import XCTest

class Tests: XCTestCase {
  func testArrayJSONFromFileNamed() {
    var success = false

    let (result, error) = JSON.from("simple_array.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let result = result {
      let compared = [["id" : 1, "name" : "Hi"]]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testArrayJSONPrettyPrint() {
    var success = false

    let (result, error) = JSON.from("simple_array.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let pretty = result?.prettyDescription() {
      XCTAssertEqual("[\n  {\n    \"id\" : 1,\n    \"name\" : \"Hi\"\n  }\n]", pretty)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testDictionaryJSONFromFileNamed() {
    var success = false

    let (result, error) = JSON.from("simple_dictionary.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let result = result {
      let compared = ["id" : 1, "name" : "Hi"]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testDictionaryJSONPrettyPrint() {
    var success = false

    let (result, error) = JSON.from("simple_dictionary.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let pretty = result?.prettyDescription() {
      XCTAssertEqual("{\n  \"id\" : 1,\n  \"name\" : \"Hi\"\n}", pretty)
      success = true
    }

    XCTAssertTrue(success)
  }

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
