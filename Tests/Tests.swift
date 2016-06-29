import Foundation
import XCTest

class Tests: XCTestCase {
  // MARK: - from

  func testArrayJSONFromFileNamed() {
    var success = false

    let result = try! JSON.from("simple_array.json", bundle: Bundle(for: Tests.self))
    if let result = result as? [[String : AnyObject]] {
      let compared = [["id" : 1, "name" : "Hi"]]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testDictionaryJSONFromFileNamed() {
    var success = false

    let result = try! JSON.from("simple_dictionary.json", bundle: Bundle(for: Tests.self))
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
      let _ = try JSON.from("nonexistingfile.json", bundle: Bundle(for: Tests.self))
    } catch ParsingError.notFound {
      failed = true
    } catch { }

    XCTAssertTrue(failed)
  }

  func testFromFileNamedWithInvalidJSON() {
    var failed = false
    do {
      let _ = try JSON.from("invalid.json", bundle: Bundle(for: Tests.self))
    } catch ParsingError.failed {
      failed = true
    } catch { }

    XCTAssertTrue(failed)
  }

  // MARK: - to JSON

  func testToJSON() {
    let expectation = self.expectation(withDescription: "GET")

    guard let url = URL(string: "http://httpbin.org/get") else { return }
    let request = URLRequest(url: url)
    URLSession.shared().dataTask(with: request) { data, _, error in
        do {
            let JSON = try data?.toJSON() as? [String : AnyObject]
            let url = JSON?["url"] as! String
            XCTAssertEqual(url, "http://httpbin.org/get")
        } catch {
            // Handle error
        }

        expectation.fulfill()
    }.resume()

    waitForExpectations(withTimeout: 10, handler: nil)
  }
}
