//
//  PresistanceController.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 2/7/21.
//

import CoreData
import Foundation

struct PersistanceController {
    static let shared = PersistanceController()
    
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name : "CoreData")
        container.loadPersistentStores { (description, error) in
           if let error = error {
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
           }
         }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in} ){
        let context = container.viewContext
        if context.hasChanges{
            do{
                try context.save()
                completion(nil)
                print("saved")
            }
            catch{
                completion(error)
                print("error")
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}){
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
}
 
