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
        measure {
            XCTAssertTrue(synchronize.runloop())
        }
    }
    
    func test_semaphore() {
        measure {
            XCTAssertTrue(synchronize.semaphore())
        }
    }
    
    func test_sleep() {
        measure {
            XCTAssertTrue(synchronize.sleep())
        }
    }
    
    func test_mainRunloop() {
        measure {
            XCTAssertTrue(synchronize.mainRunloop())
        }
    }
    
    func test_mainSemaphore() {
        measure {
            XCTAssertTrue(synchronize.mainSemaphore())
        }
    }
    
    func test_mainSleep() {
        measure {
            XCTAssertTrue(synchronize.mainSleep())
        }
    }
}
