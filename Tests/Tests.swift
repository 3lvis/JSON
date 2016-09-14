import Foundation
import XCTest

class Tests: XCTestCase {
  // MARK: - from

  func testArrayJSONFromFileNamed() {
    let result = try! JSON.from("simple_array.json", bundle: Bundle(for: Tests.self)) as? [[String : Any]]  ?? [[String : Any]]()
    let compared = [["id" : 1, "name" : "Hi"]]
    XCTAssertEqual(compared.count, result.count)

    XCTAssertEqual(Array(compared[0].keys), Array(result[0].keys))
    // XCTAssertEqual(Array(compared[0].values), Array(result[0].values))
  }

  func testDictionaryJSONFromFileNamed() {
    let result = try! JSON.from("simple_dictionary.json", bundle: Bundle(for: Tests.self)) as? [String : Any] ?? [String : Any]()
    let compared = ["id" : 1, "name" : "Hi"] as [String : Any]
    XCTAssertEqual(compared.count, result.count)
    XCTAssertEqual(Array(compared.keys), Array(result.keys))
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
    let expectation = self.expectation(description: "GET")

    guard let url = URL(string: "http://httpbin.org/get") else { return }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, _, error in
        do {
            let JSON = try data?.toJSON() as? [String : Any]
            let url = JSON?["url"] as! String
            XCTAssertEqual(url, "http://httpbin.org/get")
        } catch {
            // Handle error
        }

        expectation.fulfill()
    }.resume()

    waitForExpectations(timeout: 10, handler: nil)
  }
}
