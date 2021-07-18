//
//  SearchView.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/25/20.
//

import SwiftUI


struct SearchView: View {
    @ObservedObject var data = GetData()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack{
                    TextField("Search", text: $data.search)
                    Button(action: {
                        if data.search != ""{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                data.findData()
                                hideKeyboard()
                                data.search = ""

                            }
                        }
                        
                        else{
                            data.meal = []
                        }
                        
                    }, label: {
                        Text("Search")
                    })
                }
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .padding(.horizontal)
                List(data.meal, id: \.self){ i in
                        NavigationLink(destination: DetailView(data: i)) {
                            SearchViewList(data: i)
                        }
                }
            }
            .onChange(of: data.search, perform: { newData in
                if newData == data.search{
                    if newData != ""{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        }
                    }
                    else{
                        data.meal = []
                    }
                }
            })
            .navigationTitle("Search")
        }
    }
}



func hideKeyboard() {
       UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }

