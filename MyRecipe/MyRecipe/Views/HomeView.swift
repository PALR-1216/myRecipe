//
//  HomeView.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/25/20.
//

import SwiftUI


struct HomeView: View {
    @ObservedObject var data = GetData()
    var body: some View{
        NavigationView{
            ScrollView{
                ForEach(data.meal, id: \.idMeal){ i in
                    NavigationLink(destination: DetailView(data: i)) {
                        ListView(data: i)
                    }
                }
            }
            .onAppear(perform: {
                data.fetchData()
            })
            .navigationTitle("Recipes")
        }
    }
}
