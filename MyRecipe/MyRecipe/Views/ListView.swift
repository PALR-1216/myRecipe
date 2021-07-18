//
//  ListView.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/24/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    var data : Meals
    var body: some View {
        LazyVStack {
                   ZStack{
                       WebImage(url: URL(string: data.strMealThumb))
                           .resizable()
                           .overlay(
                               Rectangle()
                                   .foregroundColor(.black)
                                   .opacity(0.3)
                           )
                           
                           .scaledToFit()
                           .cornerRadius(8)
                           .padding()
                           .shadow(radius: 10)
                       
                       Text(data.strMeal)
                           .font(.title)
                           .foregroundColor(.white)
                           .fontWeight(.heavy)
                   }
               }
    }
}
