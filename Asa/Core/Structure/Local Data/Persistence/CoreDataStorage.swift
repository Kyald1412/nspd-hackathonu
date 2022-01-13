//
//  CoreDataStorage.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 28/05/21.
//

import CoreData

public enum CoreDataStorageError: Error {
    case readError(Error)
    case saveError(Error)
    case deleteError(Error)
}

public final class CoreDataStorage {

    public static let shared = CoreDataStorage(container: CoreDataStorage.appScopeContainer())
    
    var persistentContainer: NSPersistentContainer!
    
    //MARK: Init with dependency
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
    }
    
    func setContainer(container: NSPersistentContainer) {
        self.persistentContainer = container
    }
    
    // MARK: - Core Data stack
    static func appScopeContainer() -> NSPersistentContainer {
        
        let bundle = Bundle(for: Self.self)
        let modelURL = bundle.url(forResource: "Asa", withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: "Asa", managedObjectModel: managedObjectModel!)

//        let container = NSPersistentContainer(name: "SmartCheckIn")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                // TODO: - Log to Crashlytics
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }
    
    

    // MARK: - Core Data Saving support
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                assertionFailure("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
    
    public func deleteAllData() {
        
        let storeCoordinator = persistentContainer.persistentStoreCoordinator
        let storeDescription = persistentContainer.persistentStoreDescriptions[0]
        guard let storeURL = storeDescription.url else {
            return
        }
        
        do {
            try storeCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
        } catch {
            return
        }
        
        storeCoordinator.addPersistentStore(with: storeDescription) {
            (_, error) in
            
            if let error = error {
                print("\(error)")
            }
        }
    }

//    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
//        persistentContainer.performBackgroundTask(block)
//    }
    
    public func newDerivedContext() -> NSManagedObjectContext {
      let context = persistentContainer.newBackgroundContext()
      return context
    }

}
