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
    let (result, error) = JSON.from("simple_array.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    var success = false
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
    let (result, error) = JSON.from("simple_dictionary.json", bundle: NSBundle(forClass: self.classForKeyedArchiver!))
    var success = false
    if let pretty = result?.prettyDescription() {
      XCTAssertEqual("{\n  \"id\" : 1,\n  \"name\" : \"Hi\"\n}", pretty)
      success = true
    }

    XCTAssertTrue(success)
  }
}
