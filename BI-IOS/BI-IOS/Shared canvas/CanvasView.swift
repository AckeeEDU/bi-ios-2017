//
//  CanvasView.swift
//  BI-IOS
//
//  Created by Jan Misar on 11.12.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit
import CoreGraphics

class CanvasView: UIView {

    var points: [CGPoint] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panChanged(_:)))
        addGestureRecognizer(gestureRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func panChanged(_ gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            break
        case .changed:
            let point = gestureRecognizer.location(in: self)
            points.append(point)
            break
        case .cancelled, .ended, .failed:
            break
        default:
            break
        }
        setNeedsDisplay()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(1)
        context.setStrokeColor(UIColor.black.cgColor)
        
        context.beginPath()
        
        if let firstPoint = points.first {
            context.move(to: firstPoint)
        }
        context.addLines(between: points)
        
        context.drawPath(using: .stroke)
    }
    

}
