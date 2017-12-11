//
//  DrawingPath.swift
//  BI-IOS
//
//  Created by Jan Misar on 11.12.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit

class DrawingPath {
    
    var key: String?
    var points: [CGPoint] = []
    var color: UIColor = .black
    var lineWidth: CGFloat = 1
    
    static func deserialize(from object: [String: Any]) -> DrawingPath? {
        let result = DrawingPath()
        
        if let points = object["points"] as? [[String: Any]]  {
            result.points = points.map { pointDict in
                let x = pointDict["x"] as! CGFloat
                let y = pointDict["y"] as! CGFloat
                return CGPoint(x: x, y: y)
            }
        } else {
            return nil
        }
        
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
