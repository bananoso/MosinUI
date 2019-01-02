//
//  CGRect+Extensions.swift
//  Square
//
//  Created by Mosin Dmitry on 28.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

extension CGRect {
    
    var topLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.minY)
    }
    
    var topRight: CGPoint {
        return CGPoint(x: self.maxX, y: self.minY)
    }
    
    var bottomRight: CGPoint {
        return CGPoint(x: self.maxX, y: self.maxY)
    }
    
    var bottomLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.maxY)
    }
    
    var leftCenter: CGPoint {
        return CGPoint(x: self.minX, y: self.midY)
    }
    
    var rightCenter: CGPoint {
        return CGPoint(x: self.maxX, y: self.midY)
    }
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    
    var topCenter: CGPoint {
        return CGPoint(x: self.midX, y: self.minY)
    }
    
    var bottomCenter: CGPoint {
        return CGPoint(x: self.midX, y: self.maxY)
    }
    
    func inset(for view: UIView) -> CGRect {
        let frame = view.frame
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: frame.width)
        
        return self.inset(by: inset)
    }
}
