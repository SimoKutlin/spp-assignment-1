//
//  CanvasView.swift
//  Assignment1
//
//  Created by admin on 02.04.17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class CanvasView: UIView {


    private var path: UIBezierPath = UIBezierPath()
    private var color: UIColor = UIColor.clear
    
    var paintColor: UIColor {
        get {
            return color
        }
        
        set(newColor) {
            color = newColor
        }
    }
    
    func clearAll() {
        path = UIBezierPath()
        color = UIColor.clear
        setNeedsDisplay()
    }
    
    func handlePan(byReactingTo recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: self)
        
        switch recognizer.state {
        case .began:
            startAtPoint(point)
        case .changed:
            continueAtPoint(point)
        case .ended:
            endAtPoint(point)
        case .failed:
            endAtPoint(point)
        default: break
        }
    }
    
    override func draw(_ rect: CGRect) {
        paintColor.set()
        path.lineWidth = 5
        
        path.stroke()
        
        var test = UIBezierPath()
        test.move(to: CGPoint(x: 20.0, y: 20.0))
        test.move(to: CGPoint(x: 40.0, y: 50.0))
        test.stroke()
        print("drawn with color \(paintColor.description)")
    }
    
    private func startAtPoint(_ point: CGPoint) {
        path.move(to: point)
        print("started")
    }
    
    private func continueAtPoint(_ point: CGPoint) {
        // 2. Accumulate points as they are reported by the gesture recognizer, in a bezier path object
        path.move(to: point)
        print("moving")
        // Trigger a redraw every time a point is added (finger moves)
        self.setNeedsDisplay()
    }
    
    private func endAtPoint(_ point: CGPoint) {
        // Nothing to do when ending/cancelling for now
        print("ended")
        self.setNeedsDisplay()
    }
    

    
    
}
