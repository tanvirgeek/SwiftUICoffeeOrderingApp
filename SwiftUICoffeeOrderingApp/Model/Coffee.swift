//
//  Coffee.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 17/11/20.
//

import Foundation

struct Coffee{
    let name:String
    let imageURL: String
    let price:Double
}

extension Coffee{
    static func all ()->[Coffee]{
        return[
                Coffee(name: "Cappucino", imageURL: "Cappucino", price: 2.5),
                Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
                Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
