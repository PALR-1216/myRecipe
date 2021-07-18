//
//  ContentView.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/24/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var data = GetData()
    @State var selected = 1
    @State var show = false
    
    var body: some View {
        
        
        TabView(selection: $selected) {
            
            HomeView().tabItem{
                
                Image(systemName: "house")
                Text("Home")
                
            }.tag(1)
            
            SearchView().tabItem{
                
                Image(systemName: "magnifyingglass")
                Text("Search")
                
                
            }.tag(2)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




