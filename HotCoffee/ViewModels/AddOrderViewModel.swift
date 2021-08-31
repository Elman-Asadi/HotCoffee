//
//  AddOrderViewModel.swift
//  HotCoffee
//
//  Created by Elman Asadi on 8/31/21.
//

import Foundation


class AddOrderViewModel {
    
    var name : String = ""
    var type : String = ""
    
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: name, type: type)
    }
    
}
