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
    
    typealias Position = CGRect.Position
    
    private struct Strings {
        
        static let stop = "Stop"
        static let start = "Start"
    }

    private(set) var isStopped = true {
        didSet {
            let newTitle = oldValue ? Strings.stop : Strings.start
            self.button?.setTitle(newTitle, for: .normal)
        }
    }
    
    private(set) var isAnimated = false
    
    private var squarePosition = Position.topLeft

    private let positions = CyclicSequence(Position.topLeft, .topRight, .bottomRight, .bottomLeft)
    
    func startAutoMove() {
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
            animations: { self.label?.frame.origin = self.point(at: position) },
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
    
    private func point(at position: Position) -> CGPoint {
        return self.bounds
            .inset(by: self.safeAreaInsets)
            .cutted(by: self.label)
            .point(at: position)
    }
}
