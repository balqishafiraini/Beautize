//
//  Skincare+CoreDataProperties.swift
//  Beautize
//
//  Created by Balqis on 27/04/22.
//
//

import Foundation
import CoreData


extension Skincare {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Skincare> {
        return NSFetchRequest<Skincare>(entityName: "Skincare")
    }

    @NSManaged public var brand: String?
    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var category: String?

}

extension Skincare : Identifiable {

}
