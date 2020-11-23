//
//  CoffeeViewModel.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 23/11/20.
//

import Foundation

class CoffeeListViewModel{
    var coffeeList: [CoffeViewModel] = [CoffeViewModel]()
    
}

struct CoffeViewModel{
    var coffee: Coffee
    
    init(coffee:Coffee){
        self.coffee = coffee
    }
    var name:String{
        return self.coffee.name
    }
    var imageURL:String {
        return self.coffee.imageURL
    }
    var price:Double{
        return self.coffee.price
    }
}
