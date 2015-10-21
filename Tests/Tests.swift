import Foundation
import XCTest

class Tests: XCTestCase {
  // MARK: - from

  func testArrayJSONFromFileNamed() {
    var success = false

    let result = try! JSON.from("simple_array.json", bundle: NSBundle(forClass: Tests.self))
    if let result = result as? [[String : AnyObject]] {
      let compared = [["id" : 1, "name" : "Hi"]]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testDictionaryJSONFromFileNamed() {
    var success = false

    let result = try! JSON.from("simple_dictionary.json", bundle: NSBundle(forClass: Tests.self))
    if let result = result as? [String : NSObject] {
      let compared = ["id" : 1, "name" : "Hi"]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testFromFileNamedWithNotFoundFile() {
    var failed = false
    do {
      try JSON.from("nonexistingfile.json", bundle: NSBundle(forClass: Tests.self))
    } catch ParsingError.NotFound {
      failed = true
    } catch { }

    XCTAssertTrue(failed)
  }

  func testFromFileNamedWithInvalidJSON() {
    var failed = false
    do {
      try JSON.from("invalid.json", bundle: NSBundle(forClass: Tests.self))
    } catch ParsingError.Failed {
      failed = true
    } catch { }

    XCTAssertTrue(failed)
  }

  // MARK: - to JSON

  func testToJSON() {
    let expectation = expectationWithDescription("GET")

    guard let url = NSURL(string: "http://httpbin.org/get") else { return }
    let request = NSURLRequest(URL: url)
    NSURLSession.sharedSession().dataTaskWithRequest(request) { data, _, error in
        do {
            let JSON = try data?.toJSON() as? [String : AnyObject]
            let url = JSON?["url"] as! String
            XCTAssertEqual(url, "http://httpbin.org/get")
        } catch {
            // Handle error
        }

        expectation.fulfill()
    }.resume()

    waitForExpectationsWithTimeout(10, handler: nil)
  }
}
