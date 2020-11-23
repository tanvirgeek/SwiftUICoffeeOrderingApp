//
//  AddCoffeeOrderViewModel.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 23/11/20.
//

import Foundation

class AddCoffeeOrderViewModel:ObservableObject{
    var name:String = ""
    @Published var size:String = "Medium"
    @Published var coffeeName = ""
    
    private var webService:Webservice
    
    var coffeeList: [CoffeViewModel] {
        return Coffee.all().map(CoffeViewModel.init)
    }
    init(){
        self.webService = Webservice()
    }
    
    var total: Double{
        return calculateTotatPrice()
    }
    
    func placeOrder(){
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        
        self.webService.createCoffeeOrder(order: order) { (createOrderResponse) in
            
        }
    }
    
    private func prizeForSize() -> Double {
        let prices = ["Small": 2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotatPrice()->Double{
        let coffeeVM = coffeeList.first {$0.name == coffeeName}
        if let coffeeMV = coffeeVM{
            return coffeeMV.price * prizeForSize()
        }else{
            return 0.0
        }
    }
}
