//
//  PersistenceManager.swift.swift
//  CoreData_Practice
//
//  Created by Mangdi on 2022/12/26.
//

import Foundation
import CoreData

class PersistenceManager {
    static var shared: PersistenceManager = PersistenceManager()
    private init() { }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }

    var personEntity: NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "Contact", in: context)
    }

    func save() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    // Create
    func insertContact(person: Person) {
        if let entity = personEntity {
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            managedObject.setValue(person.name, forKey: "name")
            managedObject.setValue(person.number, forKey: "number")
            save()
        }
    }

    // Read
//    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
//        do {
//            let fetchResult = try self.context.fetch(request)
//            return fetchResult
//        } catch {
//            print(error.localizedDescription)
//            return []
//        }
//    }
    // Read
    func fetchContact() -> [Contact] {
        do {
            let request = Contact.fetchRequest()
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
        }
        return []
    }

    func getContact() -> [Person] {
        var persons: [Person] = []
        let fetchResults = fetchContact()
        for result in fetchResults {
            let person = Person(name: result.name ?? "", number: result.number ?? "")
            persons.append(person)
        }
        return persons
    }

    // Update
    func updateContact(person: Person) {
        let fetchResults = fetchContact()
        for result in fetchResults {
            if result.name == person.name {
                result.number = "업데이트"
            }
        }
        save()
    }

    // Delete
    func delete(person: Person) {
        let fetchResults = fetchContact()
        let persons = fetchResults.filter { $0.name == person.name }
        for person in persons {
            context.delete(person)
        }
        save()
    }

//    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>) {
//        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
//        let delete = NSBatchDeleteRequest(fetchRequest: request)
//
//        do {
//            try context.execute(delete)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    func deleteAllContact() {
        let fetchResults = fetchContact()
        for result in fetchResults {
            context.delete(result)
        }
        save()
    }
}
