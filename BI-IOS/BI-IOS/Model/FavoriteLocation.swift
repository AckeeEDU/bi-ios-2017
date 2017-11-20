//
//  FavoriteLocation.swift
//  BI-IOS
//
//  Created by Jan Misar on 20.11.17.
//  Copyright © 2017 ČVUT. All rights reserved.
//

import UIKit
import MapKit

class FavoriteLocation: NSObject, MKAnnotation {
    
    var latitude: Double!
    var longitude: Double!
    
    var title: String? = "Example"
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
