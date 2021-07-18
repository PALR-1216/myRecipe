//
//  DetailView.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/24/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var data: Meals
    @State var show = false
    var body: some View {
        ScrollView{
            ZStack{
                WebImage(url: URL(string: data.strMealThumb))
                    .resizable()
                    .overlay(
                        Rectangle()
                            .background(Color.black)
                            .opacity(0.2)
                    )
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.top)
                    .shadow(radius:6)
                VStack{
                    Text(data.strMeal)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                }
            }
            .frame(height: 400)
            
            VStack{
                Text("Instructions")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text(data.strInstructions)
                    .padding()
                
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Text("See video")
                })
                .padding()
                .padding(.bottom)
            }
        }
        .sheet(isPresented: $show, content: {
            WebView(url: data.strYoutube)
        })
    }
}


