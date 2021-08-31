//
//  NSManagedObjectExtensions.swift
//  HotCoffee
//
//  Created by Elman Asadi on 8/31/21.
//

import UIKit
import CoreData

extension NSManagedObjectContext {
    
    static var current : NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
