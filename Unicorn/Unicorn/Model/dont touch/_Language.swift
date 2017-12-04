// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Language.swift instead.

import Foundation
import CoreData

public enum LanguageAttributes: String {
    case abbr = "abbr"
    case flag = "flag"
    case language_code = "language_code"
    case latitude = "latitude"
    case longitude = "longitude"
    case name = "name"
    case sentence = "sentence"
    case seen = "seen"

}

open class _Language: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Language"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Language.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var abbr: String?

    @NSManaged open
    var flag: String?

    @NSManaged open
    var language_code: String?

    @NSManaged open
    var latitude: NSNumber?

    @NSManaged open
    var longitude: NSNumber?

    @NSManaged open
    var name: String?

    @NSManaged open
    var sentence: String?

    @NSManaged open
    var seen: NSNumber
    // MARK: - Relationships

}

