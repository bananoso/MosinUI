//
//  SquareViewController.swift
//  Square
//
//  Created by Mosin Dmitry on 25.12.2018.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = SquareView
        
    @IBAction func onStartButton(_ sender: UIButton) {
        self.rootView.do {
            if $0.isStopped && !$0.isAnimated {
                $0.autoMoveSquare()
            }

            $0.isStopped.toggle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
