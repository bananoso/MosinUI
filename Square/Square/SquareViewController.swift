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
        (self.squareView?.isStoped).do {
            if $0 {
                self.squareView?.isStoped = false
                self.squareView?.autoMovingSquare()
            } else {
                self.squareView?.isStoped = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
