//
//  LinkedList.swift
//  SwiftDataStructures
//
//  Created by 이명진 on 2/6/25.
//

import Foundation


// MARK: - Node

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

// MARK: - LinkedList

class LinkedList<T: Equatable> {
    private var head: Node<T>?
}

extension LinkedList {
    
    // O(N)
    func append(_ data: T) {
        
        if head == nil { // head가 없는 경우 새로온 붙힌 노드가 head
            head = Node(data: data)
            return
        }
        
        var currentNode = head
        
        while currentNode?.next != nil { // next 가 없을 때 까지 반복
            currentNode = currentNode?.next
        }
        
        currentNode?.next = Node(data: data)
        
    }
    
    // O(N)
    func insert(data: T?, index: Int) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var currentNode = head
        
        for _ in 0..<(index-1) {
            if currentNode?.next == nil { break } // 현재 노드가 마지막이라면 break
            
            currentNode = currentNode?.next
        }
        
        let nextNode = currentNode?.next
        currentNode?.next = Node(data: data)
        currentNode?.next?.next = nextNode
    }
    
    // O(N)
    func removeLast() {
        
        if head == nil { return }
        
        // head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        
        var currentNode = head
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = currentNode?.next?.next
        
    }
    
    // O(N)
    func remove(at index: Int) {
        if head == nil { return }
        
        if index == 0 || head?.next == nil {
            head = head?.next // == nil
            return
        }
        
        var currentNode = head
        
        for _ in 0..<(index-1) {
            if currentNode?.next?.next == nil { break }
            
            currentNode = currentNode?.next
        }
        
        currentNode?.next = currentNode?.next?.next
    }
    
    // O(N)
    func searchNode(data: T?) -> Node<T>? {
        if head == nil { return nil }
        
        if head?.data == data {
            return head
        }
        
        var currentNode = head
        
        while data != currentNode?.data {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var result = ""
        var currentNode = head
        
        while currentNode != nil {
            if let data = currentNode?.data {
                result += "[\(data)]"
                if currentNode?.next != nil {
                    result += " -> "
                }
            }
            currentNode = currentNode?.next
        }
        
        return result.isEmpty ? "[]" : result
    }
}
