//
//  CoreDataAuthResponseStorage.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 05/04/2020.
//

import Foundation
import CoreData

protocol LocalAuthRepositoryProtocol {
    func getUserData(completion: @escaping (Result<UserData, CoreDataStorageError>) -> Void)
    func save(response: UserData, completion: @escaping (Result<Bool, CoreDataStorageError>) -> Void)
}

public final class LocalAuthRepository {

    private let coreDataStorage: CoreDataStorage

    public init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Private

    private func fetchRequest() -> NSFetchRequest<UserEntity> {
        let request: NSFetchRequest = UserEntity.fetchRequest()
//        request.predicate = NSPredicate(format: "%K = %@ AND %K = %d",
//                                        #keyPath(UserEntity.fname), requestDto.fname ?? "")
        return request
    }
    
    private func deleteResponse(in context: NSManagedObjectContext) {
        let request = fetchRequest()
        
        do {
            if let result = try context.fetch(request).first {
                context.delete(result)
            }
        } catch {
            print(error)
        }
    }
}

extension LocalAuthRepository: LocalAuthRepositoryProtocol {

    func getUserData(completion: @escaping (Result<UserData, CoreDataStorageError>) -> Void) {
            do {
                let context = coreDataStorage.newDerivedContext()
                let fetchRequest = self.fetchRequest()
                if let requestEntity = try context.fetch(fetchRequest).first {
                    completion(.success(requestEntity.toDTO()))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: "Info data not found"])
                    completion(.failure(CoreDataStorageError.readError(error)))
                }

            } catch {
                completion(.failure(CoreDataStorageError.readError(error)))
            }
    }

    func save(response: UserData, completion: @escaping (Result<Bool, CoreDataStorageError>) -> Void) {
        
        do {
            let context = coreDataStorage.newDerivedContext()
            self.deleteResponse(in: context)

            print("Entity response \(response)")

            _ = response.toEntity(in: context)
            try context.save()
//            print("Entity is saved \(entity)")
            completion(.success(true))

        } catch {
            // TODO: - Log to Crashlytics
            debugPrint("CoreDataAuthResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            completion(.failure(.saveError(error)))

        }
    }
}
