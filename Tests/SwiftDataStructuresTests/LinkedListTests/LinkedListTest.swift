//
//  LinkedListTest.swift
//  SwiftDataStructures
//
//  Created by 이명진 on 2/6/25.
//

import XCTest
@testable import SwiftDataStructures

final class LinkedListTest: XCTestCase {
    
    var linkedList: LinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        linkedList = LinkedList<Int>()
    }
    
    override func tearDown() {
        linkedList = nil
        super.tearDown()
    }
    
    func test_Append() {
        linkedList.append(10)
        linkedList.append(20)
        linkedList.append(30)
        
        XCTAssertEqual(linkedList.searchNode(data: 10)?.data, 10)
        XCTAssertEqual(linkedList.searchNode(data: 20)?.data, 20)
        XCTAssertEqual(linkedList.searchNode(data: 30)?.data, 30)
    }
    
    func test_Insert() {
        linkedList.append(10)
        linkedList.append(20)
        linkedList.append(30)
        
        linkedList.insert(data: 15, index: 1)
        
        XCTAssertEqual(linkedList.searchNode(data: 15)?.data, 15)
        XCTAssertEqual(linkedList.searchNode(data: 10)?.next?.data, 15) // 10 -> 15 -> 20 확인
        XCTAssertEqual(linkedList.searchNode(data: 15)?.next?.data, 20) // 15 -> 20 연결 확인
        XCTAssertEqual(linkedList.description, "[10] -> [15] -> [20] -> [30]")
    }
    
    func test_RemoveLast() {
        linkedList.append(10)
        linkedList.append(20)
        linkedList.append(30)
        
        linkedList.removeLast()
        
        XCTAssertEqual(linkedList.description, "[10] -> [20]")
    }
    
    func test_RemoveAt() {
        linkedList.append(10)
        linkedList.append(20)
        linkedList.append(30)
        linkedList.append(40)
        
        linkedList.remove(at: 1) // 20 삭제
        linkedList.remove(at: 1) // 30 삭제
        
        XCTAssertEqual(linkedList.description, "[10] -> [40]")
    }
    
    func test_SearchNode() {
        linkedList.append(10)
        linkedList.append(20)
        linkedList.append(30)
        
        let result = linkedList.searchNode(data: 20)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.data, 20)
        XCTAssertEqual(result?.next?.data, 30)
        XCTAssertEqual(linkedList.description, "[10] -> [20] -> [30]")
    }
    
}
