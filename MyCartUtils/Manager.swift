//
//  Manager.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 2/7/21.
//

import Foundation
import CoreData
import SwiftUI

class Manager {
  let manager : NSPersistentContainer = {
      let container = NSPersistentContainer(name: "Cart")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  init() {
    let center = NotificationCenter.default
    let notification = UIApplication.willResignActiveNotification

    center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
      guard let self = self else { return }

      if self.manager.viewContext.hasChanges {
        try? self.manager.viewContext.save()
      }
    }
  }
}
