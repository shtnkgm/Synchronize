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
    
    func test_runloop_subThread() {
        measure {
            XCTAssertTrue(synchronize.runloop(isMainThread: false))
        }
    }
    
    func test_semaphore_subThread() {
        measure {
            XCTAssertTrue(synchronize.semaphore(isMainThread: false))
        }
    }
    
    func test_sleep_subThread() {
        measure {
            XCTAssertTrue(synchronize.sleep(isMainThread: false))
        }
    }
    
    func test_runloop_mainThread() {
        measure {
            XCTAssertTrue(synchronize.runloop(isMainThread: true))
        }
    }

//    func test_semaphore_mainThread() {
//        measure {
//            XCTAssertTrue(synchronize.semaphore(isMainThread: true))
//        }
//    }
//
//    func test_sleep_mainThread() {
//        measure {
//            XCTAssertTrue(synchronize.sleep(isMainThread: true))
//        }
//    }
}
