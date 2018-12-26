//
//  SquareView.swift
//  Square
//
//  Created by Mosin Dmitry on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareView: UIView {

    @IBOutlet var label: UILabel!
    
    @IBOutlet var button: UIButton!
    
    var isAnimated: Bool {
        return self.token?.isRunning ?? false
    }
    
    var isStoped = true {
        didSet {
            let newTitle = oldValue ? "Stop" : "Start"
            self.button.setTitle(newTitle, for: .normal)
        }
    }
    
    private var token: Token?
    private var squarePosition = Position.leftTop
    
    func autoMoveSquare() {
        self.setSquarePosition(self.squarePosition.nextPosition) { _ in
            if !self.isStoped {
                self.autoMoveSquare()
            }
        }
    }
    
    func setSquarePosition(
        _ position: Position,
        animated: Bool = false,
        completionHandler: F.Completion<Bool>? = nil
    ) {
        guard !self.isAnimated else { return }
        
        defer { self.squarePosition = position }
        
        let nextPosition = self.squarePosition.nextPosition
        
        self.token = UIView.animationToken(withDuration: 1.0, animations: {
            self.label.frame.origin = self.point(by: nextPosition)
        },
        completion: {
            self.squarePosition = nextPosition
            completionHandler?($0)
        })
    }
    
    private func point(by position: Position) -> CGPoint {
        switch position {
        case .leftTop: return .init(x: 20, y: 44)
        case .rightTop: return .init(x: 300, y: 44)
        case .rightBottom: return .init(x: 300, y: 750)
        case .leftBottom: return .init(x: 20, y: 750)
        }
    }
}
