//
//  Synchronize.swift
//  Synchronize
//
//  Created by Shota Nakagami on 2018/12/27.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import Foundation

final class Synchronize {
    func runloop() {
        
    }
    
    func semaphore() {
        
    }
    
    func asyncFunction(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            completion()
        }
    }
}
