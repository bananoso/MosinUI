//
//  SquareView.swift
//  Square
//
//  Created by Mosin Dmitry on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareView: UIView {

    @IBOutlet var label: UILabel?
    
    @IBOutlet var button: UIButton?
    
    var isAnimated: Bool {
        return self.token?.isRunning ?? false
    }
    
    var isStopped = true {
        didSet {
            let newTitle = oldValue ? "Stop" : "Start"
            self.button?.setTitle(newTitle, for: .normal)
        }
    }
    
    private var token: Token?
    private var squarePosition = Position.topLeft
    
    private let screenBounds = UIScreen.main.bounds
    private let offsetX: CGFloat = 20
    private let offsetY: CGFloat = 44
    
    func autoMoveSquare() {
        
    }
    
    func setSquarePosition(
        _ position: Position,
        animated: Bool = true,
        completionHandler: F.Completion<Bool>? = nil
    ) {
        self.token = UIView.animationToken(
            withDuration: animated ? 1.0 : 0,
            animations: { self.label?.frame.origin = self.point(by: position) },
            completion: {
                self.squarePosition = position
                completionHandler?($0)
            }
        )
    }
    
    private func point(by position: Position) -> CGPoint {
        return CGPoint(x: 0, y: 0)
    }
}
