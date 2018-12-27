//
//  SynchronizeTests.swift
//  SynchronizeTests
//
//  Created by Shota Nakagami on 2018/12/27.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import XCTest
@testable import Synchronize

class SynchronizeTests: XCTestCase {
    let synchronize = Synchronize()
    
    func test_runloop() {
        XCTAssertTrue(synchronize.runloop())
    }
    
    func test_semaphore() {
        XCTAssertTrue(synchronize.semaphore())
    }
    
    func test_mainRunloop() {
        XCTAssertTrue(synchronize.mainRunloop())
    }
    
    func test_mainSemaphore() {
        XCTAssertTrue(synchronize.mainSemaphore())
    }
}
