//
//  DoublyLinkedList.swift
//  SwiftDataStructures
//
//  Created by 이명진 on 2/6/25.
//

import Foundation

// MARK: - DoublyNode

class DoublyNode<T> {
    var prev: DoublyNode?
    var data: T?
    var next: DoublyNode?
    
    init(data: T?, prev: DoublyNode? = nil, next: DoublyNode? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

// MARK: - DoublyLinkedList

class DoublyLinkedList<T: Equatable> {
    private var head: DoublyNode<T>?
    private var tail: DoublyNode<T>?
    
    /// O(1) - tail 포인터를 활용하여 한 번의 접근만 필요
    func append(data: T?) {
        
        // 연결 리스트가 빈 경우, Node를 생성 후 head, tail로 지정한다
        if head == nil || tail == nil {
            head = DoublyNode(data: data)
            tail = head
            return
        }
        
        let newNode = DoublyNode(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    /// O(1) - 맨 뒤 노드 tail 포인터를 사용해 바로 삭제
    func removeLast() {
        
        if head == nil || tail == nil { return }
        
        //head를 삭제하는 경우(연결 리스트에 노드가 1개밖에 없는 경우)
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = tail?.next
        tail = tail?.prev // tail의 값을, 삭제하기 전 tail?.prev 노드로 변경 <바로 앞에 것>
    }
    
    /// O(N) - 앞에서부터 탐색
    func searchNode(from data: T?) -> DoublyNode<T>? {
        
        if head == nil || tail == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { break }
            node = node?.next
        }
        
        return node
    }
    
    /// O(N) - 뒤에서부터 탐색
    func searchNodeFromTail(from data: T?) -> DoublyNode<T>? {
        
        if head == nil || tail == nil { return nil }
        
        var node = tail
        while node?.prev != nil {
            if node?.data == data { break }
            node = node?.prev
        }
        
        return node
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        var result = ""
        var currentNode = head
        
        while currentNode != nil {
            if let data = currentNode?.data {
                result += "[\(data)]"
                if currentNode?.next != nil {
                    result += " <-> "
                }
            }
            currentNode = currentNode?.next
        }
        
        return result.isEmpty ? "[]" : result
    }
}
