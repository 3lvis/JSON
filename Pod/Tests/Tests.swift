import Foundation
import XCTest

class Tests: XCTestCase {
  func testFromFileNamed() {
    let (result, error) = JSON.from("simple.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    XCTAssertNotNil(result)
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
