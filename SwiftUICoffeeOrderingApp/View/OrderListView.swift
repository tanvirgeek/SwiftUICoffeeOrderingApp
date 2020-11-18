//
//  OrderListView.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 17/11/20.
//

import SwiftUI

struct OrderListView: View {
    @StateObject var orderListVM = OrderListViewModel()
    var body: some View {
        VStack{
            if orderListVM.orders.isEmpty{
                Spacer()
                ProgressView()
                Spacer()
            }
            else{
                ScrollView(){
                    LazyVStack(alignment: .leading){
                        ForEach(orderListVM.orders, id: \.id){ order in
                            HStack(alignment:.center, spacing: 10){
                                Image(order.coffeeName)
                                    .resizable()
                                    .padding(10)
                                    .frame(width:180,height:180)
                                    .aspectRatio(contentMode:.fill)
                                    .cornerRadius(10)
                                VStack(alignment: .leading, spacing:8){
                                    Text(order.name)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .fontWeight(.heavy)
                                    Text(order.coffeeName)
                                        .foregroundColor(.black)
                                        .fontWeight(.heavy)
                                    Text(order.size)
                                        .foregroundColor(.black)
                                        .fontWeight(.heavy)
                                    Text(String(format: "%0.2f", order.total))
                                        .foregroundColor(.black)
                                        .fontWeight(.heavy)
                                    
                                    
                                }
                            }
                            
                        }
                    }
                }
                
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                HStack() {
                    Image(systemName: "sun.min.fill")
                    Text("CoffeeOrder")
                        .font(.headline)
                        .foregroundColor(.orange)
                    Button(action:{}, label:{
                        Text("Add")
                            .font(.headline)
                            .foregroundColor(.orange)
                    })
                    
                }.padding()
            }
            ToolbarItem(placement:.bottomBar){
                Button("Add"){
                    
                }
            }
        }
        
        
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
