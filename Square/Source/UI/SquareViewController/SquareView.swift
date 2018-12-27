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
    
    var isStopped = true {
        didSet {
            let newTitle = oldValue ? "Stop" : "Start"
            self.button.setTitle(newTitle, for: .normal)
        }
    }
    
    var squarePosition: Position!
    
    private var token: Token?
    
    private let screanBounds = UIScreen.main.bounds
    private let offsetX: CGFloat = 20
    private let offsetY: CGFloat = 44
    
    func autoMoveSquare() {
        self.setSquarePosition(self.squarePosition.nextPosition) { _ in
            if !self.isStopped {
                self.autoMoveSquare()
            }
        }
    }
    
    func setSquarePosition(
        _ position: Position,
        animated: Bool = true,
        completionHandler: F.Completion<Bool>? = nil
    ) {
        let animation = { self.label.frame.origin = self.point(by: position) }
        
        UIView.setAnimationsEnabled(animated)
        self.token = UIView.animationToken(withDuration: 1.0, animations: animation) {
            self.squarePosition = position
            completionHandler?($0)
        }
    }
    
    private func point(by position: Position) -> CGPoint {
        let labelBounds = self.label.bounds
        let maxX = self.screanBounds.maxX - labelBounds.width - self.offsetX
        let maxY = self.screanBounds.maxY - labelBounds.height - self.offsetY
        
        switch position {
        case .leftTop: return .init(x: self.offsetX, y: self.offsetY)
        case .rightTop: return .init(x: maxX, y: self.offsetY)
        case .rightBottom: return .init(x: maxX, y: maxY)
        case .leftBottom: return .init(x: self.offsetX, y: maxY)
        }
    }
}
