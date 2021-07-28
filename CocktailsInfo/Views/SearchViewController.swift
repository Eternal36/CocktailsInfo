//
//  SearchViewController.swift
//  CocktailsInfo
//
//  Created by Дмитрий Бельков on 25.07.2021.
//

import UIKit

class SearchViewController: UITableViewController {
    
    var cocktailManager = CocktailManager()
    var searchCocktails: CocktailData? = nil
    private var timer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupSearchBar()
        tableView.backgroundColor = .white
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter cocktail name"
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchCocktails?.drinks.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CocktailViewCell
        let drink = searchCocktails?.drinks[indexPath.row]
        let urlImage = drink?.strDrinkThumb
        if urlImage != nil {
            cell.imageOfCocktail.downloadImage(from: URL(string: urlImage!)!)
        }
        cell.nameOfCocktail.text = drink?.strDrink
        cell.typeOfCocktail.text = drink?.strCategory
        cell.alcoholOrNot.text = drink?.strAlcoholic
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailView" ) as! DetailViewController
        detailVC.detailDrink = searchCocktails?.drinks[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.cocktailManager.searchForCocktails(searchText: searchText)
            self.cocktailManager.onCompletion =  { cocktails in
                self.searchCocktails = cocktails
                self.tableView.reloadData()
            }
        })
        
    }
}
