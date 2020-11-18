//
//  OrderListViewModel.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 17/11/20.
//

import Foundation

class OrderListViewModel:ObservableObject{
    
    @Published var orders = [OrderViewModel]()
    init(){
        fetchOrders()
    }
    func fetchOrders(){
        Webservice().getAllOrders { orders in
            if let orders = orders{
                //self.orders = orders.map(OrderViewModel.init)
                orders.forEach { order in
                    self.orders.append(OrderViewModel(order: order))
                }
            }
        }
    }
    
}

class OrderViewModel{
    let id = UUID()
    let order:Order
    init(order:Order) {
        self.order = order
    }
    var name:String{
        return self.order.name
    }
    var coffeeName:String{
        return self.order.coffeeName
    }
    var total:Double{
        return self.order.total
    }
    var size:String{
        return self.order.size
    }
}
