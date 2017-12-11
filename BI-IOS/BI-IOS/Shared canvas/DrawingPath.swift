//
//  DrawingPath.swift
//  BI-IOS
//
//  Created by Jan Misar on 11.12.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

class DrawingPath {
    
    var points: [CGPoint] = []
    var color: UIColor = .black
    var lineWidth: CGFloat = 1
    
    static func deserialize(from object: Any) -> DrawingPath {
        let result = DrawingPath()
        
        // todo...
        
        return result
    }
    
    func serialize() -> [String: Any] {
        var result: [String: Any] = [:]
        
        result["points"] = points.map { point in
            return ["x": point.x, "y": point.y]
        }
        //result["color"] = ...
        //result["lineWidth"] = ...
        
        return result
    }
}
