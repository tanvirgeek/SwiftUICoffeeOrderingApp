//
//  Webservice.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 17/11/20.
//

import Foundation

class Webservice{
    
    func createCoffeeOrder(order:Order,completion:@escaping (CreateOrderResponse?)->()){
        
        guard  let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let safeData = data, error == nil else{
                completion(nil)
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: safeData)
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
        }.resume()
    }
    
    func getAllOrders(completion: @escaping ([Order]?)->()){
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let safeData = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            do{
                let orders = try JSONDecoder().decode([Order].self, from: safeData)
                DispatchQueue.main.async {
                    completion(orders)
                }
            }
            catch{
                print(error)
            }
            
            
        }.resume()
    }
}
