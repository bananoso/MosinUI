//
//  Position.swift
//  Square
//
//  Created by Mosin Dmitry on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

enum Position {
    case leftTop
    case rightTop
    case rightBottom
    case leftBottom
    
    var nextPosition: Position {
        switch self {
        case .leftTop: return .rightTop
        case .rightTop: return .rightBottom
        case .rightBottom: return .leftBottom
        case .leftBottom: return .leftTop
        }
    }
    
    var point: CGPoint {
        switch self {
        case .leftTop: return .init(x: 20, y: 44)
        case .rightTop: return .init(x: 300, y: 44)
        case .rightBottom: return .init(x: 300, y: 750)
        case .leftBottom: return .init(x: 20, y: 750)
        }
    }
}
