//
//  ViewController.swift
//  CoreData_Practice
//
//  Created by Mangdi on 2022/12/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet private weak var insertMangdi: UIButton!
    @IBOutlet private weak var insertJunho: UIButton!
    @IBOutlet private weak var deleteAll: UIButton!
    let mangdi = Person(name: "Mangdi", number: "1111")
    let junho = Person(name: "Jumho", number: "2222")
    var contact: [Contact] = []
//  2-1. NSManagedObjectContext를 가져온다.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory,
                                                             .userDomainMask,
                                                             true).first else { return }
        var filePath = URL(fileURLWithPath: path)
        print(filePath)
    }

    @IBAction private func insertPerson(_ sender: UIButton) {
        if sender.restorationIdentifier == "mangdi" {
            insertContact(person: mangdi)
        } else if sender.restorationIdentifier == "junho" {
            insertContact(person: junho)
        }
    }

    @IBAction private func readData(_ sender: UIButton) {
        fetchContact()
    }

    @IBAction private func updateData(_ sender: UIButton) {
        updateContact()
    }

    @IBAction private func deletePerson(_ sender: UIButton) {
        if sender.restorationIdentifier == "deleteMangdi" {
            deleteContact(person: mangdi)
        } else {
            deleteContact(person: junho)
        }
    }

    @IBAction private func deleteAll(_ sender: UIButton) {
        deleteAllConteact()
    }
    
    private func insertContact(person: Person) {
        //      2-2. 먼저 Entity를 가져온다! 내가 어느 Entity에 저장해야하는지 알아야하니까..!!
//        let context = appDelegate.persistentContainer.viewContext
//        if let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context) {
//            //      2-3. NSManagedObject를 만든다.
//            let person = NSManagedObject(entity: entity, insertInto: context)
//
//            //      2-4. NSManagedObject에 값을 세팅해준다.
//            person.setValue(mangdi.name, forKey: "name")
//            person.setValue(mangdi.number, forKey: "number")
//
//            //      2-5. NSManagedObjectContext를 저장해준다.
//            do {
//                try context.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
        PersistenceManager.shared.insertContact(person: person)
    }

//  4. CoreData에서 내가 저장한거 불러오기
    private func fetchContact() {
//        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
//        let fetchResult = PersistenceManager.shared.fetch(request: request)
//        contact = fetchResult
//        for (index, item) in contact.enumerated() {
//            print("\(index), \(item)")
//        }
        contact = PersistenceManager.shared.fetchContact()
        let persons = PersistenceManager.shared.getContact()
        for (index, item) in persons.enumerated() {
            print("\(index), \(item)")
        }
        print("\n")
    }

    private func updateContact() {
//        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
//        let fetchResult = PersistenceManager.shared.fetch(request: request)
//        contact = fetchResult
//        contact[0].number = "3333333"
//        PersistenceManager.shared.save()
        PersistenceManager.shared.updateContact(person: mangdi)
    }

    private func deleteContact(person: Person) {
        PersistenceManager.shared.delete(person: person)
    }

    private func deleteAllConteact() {
//        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
//        let request = NSFetchRequest<Contact>(entityName: "Contact")
//        PersistenceManager.shared.deleteAll(request: request)
        PersistenceManager.shared.deleteAllContact()
    }
}

//115703 + 5785 = 121488
//-90500
//= 30988
