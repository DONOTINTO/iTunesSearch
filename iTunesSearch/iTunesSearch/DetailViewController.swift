//
//  DetailViewController.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/7/24.
//

import UIKit
import SnapKit
import Kingfisher

class DetailViewController: UIViewController {
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "12313"
        return label
    }()
    
    let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemMint
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(systemName: "star.fill")
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure() {
        
        view.backgroundColor = .white
        
        [appIconImageView, appNameLabel, descriptionLabel].forEach { view.addSubview($0) }
        
        appIconImageView.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.size.equalTo(60)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(appIconImageView)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appIconImageView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide)
        }
    }
    
    func update(_ data: AppStoreResult) {
        appNameLabel.text = data.trackName
        
        let url = URL(string: data.artworkUrl100)
        appIconImageView.kf.setImage(with: url)
        
        descriptionLabel.text = data.description
    }
}
