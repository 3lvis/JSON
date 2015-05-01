import Foundation
import XCTest

class Tests: XCTestCase {
  func testFromFileNamed() {
    let result = JSON.from("simple.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    XCTAssertNotNil(result.result)
  }
}
