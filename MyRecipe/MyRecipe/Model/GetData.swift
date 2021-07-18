//
//  GetData.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/24/20.
//
//https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata
//https://api.spoonacular.com/recipes/complexSearch?apiKey=013fec10b7b24cde8a8ba7f3f12afa87&type=breakfast&number=210
//https://api.spoonacular.com/recipes/complexSearch?apiKey=013fec10b7b24cde8a8ba7f3f12afa87&type=Lunch&number=210
//https://api.spoonacular.com/recipes/716429/information?apiKey=013fec10b7b24cde8a8ba7f3f12afa87&type=Breakfast&includeNutrition=true
import Foundation


struct MyModel: Decodable {
    var meals: [Meals]
}

struct Meals: Decodable, Hashable {
    var idMeal: String
    var strMeal: String
    var strCategory: String
    var strArea: String
    var strInstructions: String
    var strMealThumb: String
    var strYoutube: String
}




class GetData: ObservableObject{
    @Published var meal = [Meals]()
    @Published var search = ""
    
   
    
    func fetchData() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=p") else{return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            guard let data = data, err == nil else {return}
            let response = try? JSONDecoder().decode(MyModel.self, from: data)
            if let DataResponse = response{
                DispatchQueue.main.async {
                    self.meal = DataResponse.meals
                }
            }
        }.resume()
    }
    
    
    
    func findData() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(search)") else{return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            guard let data = data, err == nil else {return}
            let response = try? JSONDecoder().decode(MyModel.self, from: data)
            if let DataResponse = response{
                DispatchQueue.main.async {
                    self.meal = DataResponse.meals
                }
            }
        }.resume()
    }
}
