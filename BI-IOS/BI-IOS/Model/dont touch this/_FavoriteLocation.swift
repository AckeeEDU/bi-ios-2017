// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FavoriteLocation.swift instead.

import Foundation
import CoreData

public enum FavoriteLocationAttributes: String {
    case latitude = "latitude"
    case longitude = "longitude"
    case title = "title"
}

public enum FavoriteLocationRelationships: String {
    case user = "user"
}

open class _FavoriteLocation: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "FavoriteLocation"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _FavoriteLocation.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var latitude: NSNumber?

    @NSManaged open
    var longitude: NSNumber?

    @NSManaged open
    var title: String?

    // MARK: - Relationships

    @NSManaged open
    var user: User?

}

