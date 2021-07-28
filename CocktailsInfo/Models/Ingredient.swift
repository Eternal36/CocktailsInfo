//
//  Ingredient.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 27.07.2021.
//

import Foundation

class Ingredient {
    var ingredientName: String?
    var ingredientMeasure: String?
    
    public init(ingredientName: String?, ingredientMeasure: String?) {
        self.ingredientName = ingredientName
        self.ingredientMeasure = ingredientMeasure
    }
}
