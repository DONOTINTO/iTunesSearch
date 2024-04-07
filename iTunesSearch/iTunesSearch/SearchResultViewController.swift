//
//  SearchResultViewController.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/6/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

class SearchResultViewController: UIViewController {
    
    let searchTableView = UITableView()
    let viewModel = SearchResultViewModel()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        bind()
    }
    
    func update(search: String) {
        
        let event = BehaviorRelay(value: search)
        let input = SearchResultViewModel.Input(event: event)
        let output = viewModel.transform(input: input)
        
        searchTableView.dataSource = nil
        searchTableView.delegate = nil
        
        output.event
            .bind(to: searchTableView.rx.items(
                cellIdentifier: SearchTableViewCell.identifier,
                cellType: SearchTableViewCell.self)
            ) { row, element, cell in
                
                cell.appNameLabel.text = element.trackName
                
                guard let url = URL(string: element.artworkUrl100) else { return }
                cell.appIconImageView.kf.setImage(with: url)
                
            }.disposed(by: disposeBag)
    }
    
    func bind() {
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
        searchTableView.separatorStyle = .none
        searchTableView.backgroundColor = .clear
    }
}
