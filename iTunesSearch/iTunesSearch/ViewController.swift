//
//  ViewController.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/6/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: SearchResultViewController())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        bind()
    }
    
    func bind() {
        
        guard let resultVC = searchController.searchResultsController as? SearchResultViewController else { return }
        
        resultVC.searchTableView.rx.modelSelected(AppStoreResult.self)
            .bind(with: self) { owner, data in
                
                let nextVC = DetailViewController()
                nextVC.update(data)
                
                owner.navigationController?.pushViewController(nextVC, animated: true)
                
            }.disposed(by: disposeBag)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let resultVC = searchController.searchResultsController as? SearchResultViewController else {
            return
        }
        
        resultVC.update(search: query)
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
