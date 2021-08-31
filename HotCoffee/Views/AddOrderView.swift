//
//  AddOrderView.swift
//  HotCoffee
//
//  Created by Elman Asadi on 8/31/21.
//

import SwiftUI

struct AddOrderView: View {
    
    @Binding var isPresented : Bool
    @State private var addOrderVM = AddOrderViewModel()
    
    var body: some View {
        
        NavigationView {
            
            Group {
                
                VStack {
                    TextField("name", text: self.$addOrderVM.name)
                        .padding([.bottom, .leading], 15)
                    
                    Picker(selection: self.$addOrderVM.type, label: Text(""), content: {
                        Text("Cappoccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("ex")
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding(20)
                    
                    Button("Place order") {
                        
                        if addOrderVM.name != "" && addOrderVM.type != "" {
                            self.addOrderVM.saveOrder()
                        } 
                    
                    }.padding(EdgeInsets.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(30)
                    
                }
            }.padding()
            
            .navigationTitle("Add Order")
            
        }
        
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
