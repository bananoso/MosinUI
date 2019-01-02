//
//  SquareView.swift
//  Square
//
//  Created by Mosin Dmitry on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareView: UIView {

    struct Strings {
        
        static let stop = "Stop"
        static let start = "Start"
    }
    
    @IBOutlet var label: UILabel?
    @IBOutlet var button: UIButton?
    
    private(set) var isStopped = true {
        didSet {
            let newTitle = oldValue ? Strings.stop : Strings.start
            self.button?.setTitle(newTitle, for: .normal)
        }
    }
    
    private(set) var isAnimated = false
    
    private var squarePosition = Position.topLeft

    private let positions = CyclicSequence(Position.topLeft, .topRight, .bottomRight, .bottomLeft)
    
    func startAutoMoving() {
        if self.isStopped && !self.isAnimated {
            self.autoMoveSquare()
        }
        
        self.isStopped.toggle()
    }
    
    func setSquarePosition(
        _ position: Position,
        animated: Bool = true,
        completionHandler: F.Completion<Bool>? = nil
    ) {
        self.isAnimated = true
        UIView.animate(
            withDuration: animated ? 1.0 : 0,
            animations: { self.label?.frame.origin = self.point(by: position) },
            completion: {
                self.isAnimated = false
                self.squarePosition = position
                completionHandler?($0)
            }
        )
    }
    
    private func autoMoveSquare() {
        self.setSquarePosition(self.positions.next()) {_ in
            if !self.isStopped {
                self.autoMoveSquare()
            }
        }
    }
    
    private func point(by position: Position) -> CGPoint {
        var path = self.frame.inset(by: self.safeAreaInsets)
        self.label.do {
            path = path.inset(for: $0)
        }
        
        switch self.squarePosition {
        case .topLeft: return path.topLeft
        case .topRight: return path.topRight
        case .bottomRight: return path.bottomRight
        case .bottomLeft: return path.bottomLeft
        }
    }
}
