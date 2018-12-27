//
//  SquareViewController.swift
//  Square
//
//  Created by Mosin Dmitry on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {

    var squareView: SquareView? {
        if self.isViewLoaded {
            return self.view as? SquareView
        }

        return nil
    }
    
    @IBAction func onStartButton(_ sender: UIButton) {
        self.squareView.do {
            if $0.isStopped && !$0.isAnimated {
                $0.autoMoveSquare()
            }
            
            $0.isStopped.toggle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.squareView?.squarePosition = Position.leftTop
    }
}
