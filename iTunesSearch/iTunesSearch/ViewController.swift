//
//  ViewController.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: SearchResultViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension ViewController {
    
    func configureNavigation() {
        self.view.backgroundColor = .white
        searchController.searchBar.backgroundColor = .clear
        searchController.searchBar.barStyle = .black
        searchController.searchBar.tintColor = .black
        searchController.searchBar.searchBarStyle = .default
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        navigationItem.searchController = searchController
    }
}
