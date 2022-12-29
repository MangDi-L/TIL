//
//  Contact+CoreDataProperties.swift
//  CoreData_Practice
//
//  Created by Mangdi on 2022/12/27.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: String?

}

extension Contact : Identifiable {

}
