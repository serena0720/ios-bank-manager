//
//  WaitingLineQueueTests.swift
//  WaitingLineQueueTests
//
//  Created by Erick, Serena on 2023/07/10.
//

import XCTest
@testable import BankManagerConsoleApp

final class WaitingLineQueueTests: XCTestCase {
    var sut: WaitingLineQueue<String>?
    
    override func setUpWithError() throws {
        sut = WaitingLineQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Queue가_비었을때_isEmpty가_true입니다() {
        // given
        let expectation = true
        // when
        let result = sut?.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_Queue에_가나다를_넣었을때_peek의_값은_가나다입니다() {
        // given
        let expectation = "가나다"
        // when
        sut?.enqueue("가나다")
        let result = sut?.peek
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_Queue에_dequeue를_호출하면_해당_노드의_value를_반환합니다() {
        // given
        let expectation = "가나다"
        // when
        sut?.enqueue("가나다")
        let result = sut?.dequeue()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈_Queue에_dequeue를_호출하면_nil을_반환합니다() {
        // given
        let expectation: String? = nil
        // when
        let result = sut?.dequeue()
        // then
        XCTAssertEqual(result, expectation)
    }
}
