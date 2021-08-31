//
//  ContentView.swift
//  HotCoffee
//
//  Created by Elman Asadi on 8/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVm : OrderListViewModel = OrderListViewModel()
    @State private var isPresented : Bool = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(self.orderListVm.orders, id : \.name) { order in
                    
                    HStack {
                        
                        Image(order.type)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(10)
                        
                        
                        Text(order.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                    }
                    
                }.onDelete(perform: delete)
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("ON Dismiss")
                self.orderListVm.fetchAllOrders()
            }) {
                AddOrderView(isPresented: self.$isPresented)
            }
            .navigationTitle("Orders")
            .navigationBarItems(trailing: Button("Add New Order") {
                isPresented.toggle()
            })
        }
        
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let orderVM = self.orderListVm.orders[index]
            self.orderListVm.deleteOrder(orderVM: orderVM)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
