//
//  Optional+Extension.swift
//  Square
//
//  Created by Student on 25.10.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import Foundation

extension Optional {
    
    public func `do`(_ execute: (Wrapped) -> ()) {
        self.map(execute)
    }
    
    @discardableResult
    public func ifNil(_ execute: () -> ()) -> Optional {
        if self == nil {
            execute()
        }
        
        return self
    }
    
    public func apply<Result>(_ transform: ((Wrapped) -> Result)?) -> Result? {
        return self.flatMap { transform?($0) }
    }
}
