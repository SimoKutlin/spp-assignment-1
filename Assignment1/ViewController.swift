//
//  ViewController.swift
//  Assignment1
//
//  Created by admin on 02.04.17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView! {
        didSet {
            let handler = #selector(CanvasView.handlePan(byReactingTo:))
            let panRecognizer = UIPanGestureRecognizer(target: canvasView, action: handler)
            canvasView.addGestureRecognizer(panRecognizer)
        }
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        if let colorButton: Colored = sender {
            canvasView.paintColor = colorButton.colored()
        }
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        canvasView.clearAll()
    }

}
