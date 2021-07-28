//
//  DetailViewController.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 25.07.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailDrink: Drinks!

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var typeOfGlass: UILabel!
    @IBOutlet weak var alcoholOrNot: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    var ingredientsString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailNameLabel.text = detailDrink.strDrink
        detailImage.downloadImage(from: URL(string: detailDrink.strDrinkThumb)!)
        categoryLabel.text = detailDrink.strCategory
        typeOfGlass.text = detailDrink.strGlass
        alcoholOrNot.text = detailDrink.strAlcoholic
        instructionLabel.text = detailDrink.strInstructions
        
        for item in 0...14 {
            let ing = detailDrink.ingredientList[item].ingredientName
            let measure = detailDrink.ingredientList[item].ingredientMeasure
            if (ing != nil && measure != nil) {
                ingredientsString.append("\(measure!) \(ing!) \n")
            } else if ing != nil {
                ingredientsString.append("\(ing!) \n")
            } else {
                ingredientsString.append("")
            }
        }
        
        ingredientsLabel.text = ingredientsString
        
        print(ingredientsLabel.text!)

        
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
