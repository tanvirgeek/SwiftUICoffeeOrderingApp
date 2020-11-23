//
//  AddCoffeeOrderView.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 23/11/20.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @StateObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    var body: some View {
        NavigationView(){
            VStack{
                Form{
                    Section(header: Text("Information").font(.body)){
                        TextField("Enter name", text: $addCoffeeOrderVM.name)
                    }
                    Section(header: Text("Select Coffee").font(.body)){
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name){ coffee in
                            CoffeeCellSubView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("Select Coffee").font(.body), footer: Text("Total")){
                        
                    }
                }
            }
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}
