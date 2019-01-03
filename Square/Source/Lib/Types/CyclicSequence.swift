//
//  CyclicSequence.swift
//  Square
//
//  Created by Mosin Dmitry on 02.01.2019.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

final class CyclicSequence<Value> {
    
    private let atomicIndex = Atomic(0)
    private let values: [Value]
    
    var count: Int {
        return self.values.count
    }
    
    init(_ values: [Value]) {
        self.values = values
    }
    
    convenience init(_ values: Value...) {
        self.init(values)
    }
        
    func next() -> Value {
        return self.atomicIndex.modify {
            $0 = ($0 + 1) % self.count
            
            return self.values[$0]
        }
    }
}
