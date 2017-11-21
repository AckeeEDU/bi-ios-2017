import Foundation
import MapKit

@objc(FavoriteLocation)
open class FavoriteLocation: _FavoriteLocation, MKAnnotation {
	
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude!.doubleValue, longitude: longitude!.doubleValue)
    }
    
}
