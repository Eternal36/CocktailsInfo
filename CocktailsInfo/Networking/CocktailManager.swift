//
//  CocktailManager.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 25.07.2021.
//

import Foundation

struct CocktailManager {
        
    var onCompletion: ((CocktailData) -> Void)?
    
    func searchForCocktails(searchText: String) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(searchText)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    print("Some error")
                    return
                }
                guard let data = data else {
                    print("No data")
                    return
                }
                guard let coctails = parseJSON(withData: data) else { return }
                self.onCompletion?(coctails)
            }
        }
        task.resume()
        
        
    }
    
    func parseJSON(withData data: Data) -> CocktailData? {
        let decoder = JSONDecoder()
        do {
            let cocktails = try decoder.decode(CocktailData.self, from: data)
            return cocktails
        } catch let error as NSError {
            print("Failed to decode JSON", error.localizedDescription)
        }
        return nil
    }
}




