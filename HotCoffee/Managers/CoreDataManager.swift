//
//  CoreDataManager.swift
//  HotCoffee
//
//  Created by Elman Asadi on 8/29/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc : NSManagedObjectContext
    
    private init(moc : NSManagedObjectContext) {
        self.moc = moc
    }
    
    func saveOrder(name : String, type : String) {
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
        
    }
    
    
}
