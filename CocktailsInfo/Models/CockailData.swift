//
//  CockailData.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 25.07.2021.
//

import Foundation

struct CocktailData: Codable {
    let drinks: [Drinks]
}

struct Drinks: Codable {
    let strDrink: String
    let strCategory: String
    let strAlcoholic: String
    let strDrinkThumb: String
    let strInstructions: String
    let strGlass: String

    var ingredientList = [Ingredient]()
    
    
    
    enum CodingKeys: String, CodingKey {
        case strDrink
        case strCategory
        case strAlcoholic
        case strDrinkThumb
        case strInstructions
        case strGlass
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
    }
    
    // MARK: - Decoder
    //FIXME: Refactor this part
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        strDrink = try container.decode(String.self, forKey: .strDrink)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strAlcoholic = try container.decode(String.self, forKey: .strAlcoholic)
        strDrinkThumb = try container.decode(String.self, forKey: .strDrinkThumb)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strGlass = try container.decode(String.self, forKey: .strGlass)
        
        let ing1: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient1)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure1)))
        ingredientList.append(ing1 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing2: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient2)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure2)))
        ingredientList.append(ing2 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing3: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient3)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure3)))
        ingredientList.append(ing3 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing4: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient4)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure4)))
        ingredientList.append(ing4 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing5: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient5)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure5)))
        ingredientList.append(ing5 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing6: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient6)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure6)))
        ingredientList.append(ing6 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing7: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient7)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure7)))
        ingredientList.append(ing7 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing8: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient8)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure8)))
        ingredientList.append(ing8 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing9: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient9)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure9)))
        ingredientList.append(ing9 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing10: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient10)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure10)))
        ingredientList.append(ing10 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing11: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient11)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure11)))
        ingredientList.append(ing11 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing12: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient12)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure12)))
        ingredientList.append(ing12 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing13: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient13)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure13)))
        ingredientList.append(ing13 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing14: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient14)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure14)))
        ingredientList.append(ing14 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
        
        let ing15: Ingredient? = Ingredient(ingredientName: (try? container.decode(String.self, forKey: .strIngredient15)), ingredientMeasure: (try? container.decode(String.self, forKey: .strMeasure15)))
        ingredientList.append(ing15 ?? Ingredient(ingredientName: nil,ingredientMeasure: nil))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(strDrink, forKey: .strDrink)
        try container.encode(strCategory, forKey: .strCategory)
        try container.encode(strAlcoholic, forKey: .strAlcoholic)
        try container.encode(strInstructions, forKey: .strInstructions)
        try container.encode(strGlass, forKey: .strGlass)

        try container.encode(ingredientList[0].ingredientName, forKey: .strIngredient1)
        try container.encode(ingredientList[0].ingredientMeasure, forKey: .strMeasure1)
        
        try container.encode(ingredientList[1].ingredientName, forKey: .strIngredient2)
        try container.encode(ingredientList[1].ingredientMeasure, forKey: .strMeasure2)
        
        try container.encode(ingredientList[2].ingredientName, forKey: .strIngredient3)
        try container.encode(ingredientList[2].ingredientMeasure, forKey: .strMeasure3)
        
        try container.encode(ingredientList[3].ingredientName, forKey: .strIngredient4)
        try container.encode(ingredientList[3].ingredientMeasure, forKey: .strMeasure4)
        
        try container.encode(ingredientList[4].ingredientName, forKey: .strIngredient5)
        try container.encode(ingredientList[4].ingredientMeasure, forKey: .strMeasure5)
        
        try container.encode(ingredientList[5].ingredientName, forKey: .strIngredient6)
        try container.encode(ingredientList[5].ingredientMeasure, forKey: .strMeasure6)
        
        try container.encode(ingredientList[6].ingredientName, forKey: .strIngredient7)
        try container.encode(ingredientList[6].ingredientMeasure, forKey: .strMeasure7)
        
        try container.encode(ingredientList[7].ingredientName, forKey: .strIngredient8)
        try container.encode(ingredientList[7].ingredientMeasure, forKey: .strMeasure8)
        
        try container.encode(ingredientList[8].ingredientName, forKey: .strIngredient9)
        try container.encode(ingredientList[8].ingredientMeasure, forKey: .strMeasure9)
        
        try container.encode(ingredientList[9].ingredientName, forKey: .strIngredient10)
        try container.encode(ingredientList[9].ingredientMeasure, forKey: .strMeasure10)
        
        try container.encode(ingredientList[10].ingredientName, forKey: .strIngredient11)
        try container.encode(ingredientList[10].ingredientMeasure, forKey: .strMeasure11)
        
        try container.encode(ingredientList[11].ingredientName, forKey: .strIngredient12)
        try container.encode(ingredientList[11].ingredientMeasure, forKey: .strMeasure12)
        
        try container.encode(ingredientList[12].ingredientName, forKey: .strIngredient13)
        try container.encode(ingredientList[12].ingredientMeasure, forKey: .strMeasure13)
        
        try container.encode(ingredientList[13].ingredientName, forKey: .strIngredient14)
        try container.encode(ingredientList[13].ingredientMeasure, forKey: .strMeasure14)
        
        try container.encode(ingredientList[14].ingredientName, forKey: .strIngredient15)
        try container.encode(ingredientList[14].ingredientMeasure, forKey: .strMeasure15)
    }
    
}
