import Foundation
import XCTest

class Tests: XCTestCase {
  func testFromFileNamed() {
    var success = false
    let (result, error) = JSON.from("simple.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    if let result = result {
      let compared = [["id" : 1, "name" : "Hi"]]
      XCTAssertEqual(compared, result)
      success = true
    }

    XCTAssertTrue(success)
  }

  func testPrettyPrint() {
    let (result, error) = JSON.from("simple.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    var success = false
    if let pretty = result?.prettyDescription() {
      XCTAssertEqual("[\n  {\n    \"id\" : 1,\n    \"name\" : \"Hi\"\n  }\n]", pretty)
      success = true
    }

    XCTAssertTrue(success)
  }
}
