//
//  Synchronize.swift
//  Synchronize
//
//  Created by Shota Nakagami on 2018/12/27.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation

final class Synchronize {
    func runloop(isMainThread: Bool) -> Bool {
        var result = false
        var isFinished = false
        
        asyncFunction(isMainThread: isMainThread) {
            isFinished = true
            result = true
        }
        
        while !isFinished {
           RunLoop.current.run(mode: .default, before: Date().addingTimeInterval(0.01))
        }
        
        return result
    }
    
    func semaphore(isMainThread: Bool) -> Bool {
        var result = false
        let semaphore = DispatchSemaphore(value: 0)
        
        asyncFunction(isMainThread: isMainThread) {
            semaphore.signal()
            result = true
        }
        
        if semaphore.wait(timeout: DispatchTime.now() + 3) == .timedOut {
            return false
        }
        
        return result
    }
    
    func sleep(isMainThread: Bool) -> Bool {
        let date = Date()
        var result = false
        var isFinished = false
        
        asyncFunction(isMainThread: isMainThread) {
            isFinished = true
            result = true
        }
        
        while !isFinished && date.timeIntervalSinceNow < 3 {
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        return result
    }
    
    func asyncFunction(isMainThread: Bool, completion: @escaping () -> Void) {
        let queue: DispatchQueue = isMainThread ? .main : .global()
        queue.async {
            completion()
        }
    }
}
