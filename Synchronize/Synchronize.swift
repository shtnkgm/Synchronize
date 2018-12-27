//
//  Synchronize.swift
//  Synchronize
//
//  Created by Shota Nakagami on 2018/12/27.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation

final class Synchronize {
    func runloop() -> Bool {
        var result = false
        var isFinished = false
        
        asyncFunction {
            isFinished = true
            result = true
        }
        
        while !isFinished {
           RunLoop.current.run(mode: .default, before: Date().addingTimeInterval(0.01))
        }
        
        return result
    }
    
    func semaphore() -> Bool {
        var result = false
        let semaphore = DispatchSemaphore(value: 0)
        
        asyncFunction {
            semaphore.signal()
            result = true
        }
        
        if semaphore.wait(timeout: DispatchTime.now() + 3) == .timedOut {
            return false
        }
        
        return result
    }
    
    func sleep() -> Bool {
        let date = Date()
        var result = false
        var isFinished = false
        
        asyncFunction {
            isFinished = true
            result = true
        }
        
        while !isFinished && date.timeIntervalSinceNow < 3 {
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        return result
    }
    
    func mainRunloop() -> Bool {
        var result = false
        var isFinished = false
        
        mainAsyncFunction {
            isFinished = true
            result = true
        }
        
        while !isFinished {
            RunLoop.current.run(mode: .default, before: Date().addingTimeInterval(0.01))
        }
        
        return result
    }
    
    func mainSemaphore() -> Bool {
        var result = false
        let semaphore = DispatchSemaphore(value: 0)
        
        mainAsyncFunction {
            semaphore.signal()
            result = true
        }
        
        if semaphore.wait(timeout: DispatchTime.now() + 3) == .timedOut {
            return false
        }
        
        return result
    }
    
    func mainSleep() -> Bool {
        let date = Date()
        var result = false
        var isFinished = false
        
        mainAsyncFunction {
            isFinished = true
            result = true
        }
        
        while !isFinished && date.timeIntervalSinceNow < 3 {
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        return result
    }
    
    func asyncFunction(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            completion()
        }
    }
    
    func mainAsyncFunction(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
}
