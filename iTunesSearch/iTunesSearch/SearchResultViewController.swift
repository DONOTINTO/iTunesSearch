//
//  SearchResultViewController.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/6/24.
//

import UIKit
import SnapKit

class SearchResultViewController: UIViewController {
    
    let searchTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}

extension SearchResultViewController {
    
    func configure() {
        
        view.addSubview(searchTableView)
        
        searchTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        searchTableView.rowHeight = UITableView.automaticDimension
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.separatorStyle = .none
        searchTableView.backgroundColor = .clear
    }
}
