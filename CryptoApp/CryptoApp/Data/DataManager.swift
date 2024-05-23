//
//  DataManager.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 23/5/24.
//

import Foundation
import CoreData

class DataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HomeCryptoCoinData")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError?{
                fatalError()
            }
        }
        return container
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do {
                try context.save()
            } catch  {
                let error = error as NSError
                print("Hubo un error \(error)")
            }
        }
    }
    
    static let shared: DataManager = {
        let instance = DataManager()
        return instance
    }()
}
