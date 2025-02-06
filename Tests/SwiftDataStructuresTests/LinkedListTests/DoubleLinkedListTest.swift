//
//  DoubleLinkedListTest.swift
//  SwiftDataStructures
//
//  Created by 이명진 on 2/6/25.
//

import XCTest
@testable import SwiftDataStructures

final class DoubleLinkedListTest: XCTestCase {

    var doublyLinkedList: DoublyLinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        doublyLinkedList = DoublyLinkedList<Int>()
    }
    
    override func tearDown() {
        doublyLinkedList = nil
        super.tearDown()
    }
    
    // O(1)
    func test_append() {
        doublyLinkedList.append(data: 10)
        doublyLinkedList.append(data: 20)
        doublyLinkedList.append(data: 30)
        
        XCTAssertEqual(doublyLinkedList.description, "[10] <-> [20] <-> [30]")
    }
    
    // O(1)
    func test_removeLast() {
        doublyLinkedList.append(data: 15)
        doublyLinkedList.append(data: 25)
        doublyLinkedList.append(data: 35)
        
        doublyLinkedList.removeLast()
        
        XCTAssertEqual(doublyLinkedList.description, "[15] <-> [25]")
        
        doublyLinkedList.removeLast()
        
        XCTAssertEqual(doublyLinkedList.description, "[15]")
    }
    
    // O(1)
    func test_search() {
        doublyLinkedList.append(data: 15)
        doublyLinkedList.append(data: 25)
        doublyLinkedList.append(data: 35)
        
        let node = doublyLinkedList.searchNode(from: 25)
        
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.data, 25)
        
        XCTAssertEqual(doublyLinkedList.description, "[15] <-> [25] <-> [35]")
    }

}
