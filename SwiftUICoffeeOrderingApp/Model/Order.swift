//
//  Order.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 17/11/20.
//

import Foundation

struct Order:Codable{
    let name:String
    let coffeeName:String
    let total:Double
    let size:String
}
