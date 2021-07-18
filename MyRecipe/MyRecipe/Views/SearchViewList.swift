//
//  SearchViewList.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/25/20.
//

import SwiftUI
import SDWebImageSwiftUI
struct SearchViewList: View {
    var data: Meals
    var body: some View {
        HStack{
            WebImage(url: URL(string: data.strMealThumb))
                .resizable()
                .scaledToFit()
                .shadow(radius: 5)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading){
                Text(data.strMeal)
                    .font(.title3)
                Text(data.strCategory)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical)
        }
    }
}
