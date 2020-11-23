//
//  CoffeeCellSubView.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 23/11/20.
//

import SwiftUI

struct CoffeeCellSubView: View {
    var coffee: CoffeViewModel
    @Binding var selection:String
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding(.leading,20)
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}


