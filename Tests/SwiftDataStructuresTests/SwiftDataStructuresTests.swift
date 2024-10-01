import XCTest
@testable import SwiftDataStructures

final class SwiftDataStructuresTests: XCTestCase {
    
    var heap: Heap<Int>!
    
    override func setUp() {
        super.setUp()
        self.heap = Heap<Int>(sortFunction: >)
    }
    
    override func tearDown() {
        heap = nil
        super.tearDown()
    }
    
    func test_SwimUp() {
        for i in [1, 9, 8, 10] {
            heap.insert(i)
        }
        
        XCTAssertEqual(heap.description, "[10, 9, 8, 1]")
    }
    
    func test_삽입_삭제() {
        heap.insert(10)
        heap.insert(9)
        heap.insert(8)
        heap.insert(1)
        XCTAssertEqual(heap.remove(), 10)
    }
}
