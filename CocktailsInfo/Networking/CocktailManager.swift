//
//  CocktailManager.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 25.07.2021.
//

import Foundation

struct CocktailManager {
    
    let cache = NSCache<AnyObject, AnyObject>()
    var onCompletion: ((CocktailData) -> Void)?
    
    func searchForCocktails(searchText: String) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(searchText)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    guard let fromCache = cache.object(forKey: urlString as AnyObject) else {
                        print("Some error")
                        return
                    }
                    onCompletion!(fromCache as! CocktailData)
                    return
                }
                guard let data = data else {
                    print("No data")
                    return
                }
                guard let fromCache = cache.object(forKey: urlString as AnyObject) else {
                    guard let coctails = parseJSON(withData: data) else { return }
                    onCompletion?(coctails)
                    cache.setObject(coctails as AnyObject, forKey: urlString as AnyObject)
                    return
                }
                onCompletion!(fromCache as! CocktailData)
                return
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




