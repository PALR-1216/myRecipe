//
//  Home.swift
//  MyRecipe
//
//  Created by Pedro Alejandro on 12/27/20.
//

import Foundation

struct Home {
    let categorys = [
        Category(title: "BreakFast", query: "BreakFast"),
        Category(title: "Lunch", query: "Lunch"),
        Category(title: "Dessert", query: "Dessert")
    ]
}

struct Category {
    var title: String
    var query: String
    
}
