//
//  UIView+Extensions.swift
//  Square
//
//  Created by Mosin Dmitry on 26.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

extension UIView {
    
    class Token {
        fileprivate(set) var isRunning = true
    }
    
    static func animationToken(
        withDuration: TimeInterval,
        animations: @escaping () -> (),
        completion: F.Completion<Bool>? = nil
    )
        -> Token
    {
        let token = Token()
        
        UIView.animate(withDuration: withDuration, animations: animations) {
            token.isRunning = false
            completion?($0)
        }
        
        return token
    }
}
