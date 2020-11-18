//
//  ContentView.swift
//  SwiftUICoffeeOrderingApp
//
//  Created by MD Tanvir Alam on 17/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(){
            OrderListView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
