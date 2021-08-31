//
//  OrderListViewModel.swift
//  HotCoffee
//
//  Created by Elman Asadi on 8/31/21.
//

import Foundation
import SwiftUI
import CoreData

class OrderListViewModel : ObservableObject {
    
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.fetchAllOrders().map(OrderViewModel.init)
        print(orders)
    }
    
}


class OrderViewModel {
    var name = ""
    var type = ""
    
    init(order : Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
