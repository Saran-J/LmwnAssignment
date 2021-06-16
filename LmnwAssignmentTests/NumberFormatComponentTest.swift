import Foundation
import XCTest
@testable import LmnwAssignment

class NumberFormatComponentTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testWhenInputSomeIntShouldReturnCorrectFormat() {
        let component = NumberFormatComponent()
        var result = ""
        result = component.formatDecimal(number: 1)
        XCTAssertEqual("1", result)
        result = component.formatDecimal(number: 10)
        XCTAssertEqual("10", result)
        result = component.formatDecimal(number: 1000)
        XCTAssertEqual("1,000", result)
        result = component.formatDecimal(number: -1000)
        XCTAssertEqual("-1,000", result)
        result = component.formatDecimal(number: 99999999)
        XCTAssertEqual("99,999,999", result)
    }
}
