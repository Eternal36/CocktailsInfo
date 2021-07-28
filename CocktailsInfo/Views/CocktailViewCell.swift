//
//  CocktailViewCell.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 25.07.2021.
//

import UIKit

class CocktailViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOfCocktail: UIImageView!
    @IBOutlet weak var nameOfCocktail: UILabel!
    @IBOutlet weak var typeOfCocktail: UILabel!
    @IBOutlet weak var alcoholOrNot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
