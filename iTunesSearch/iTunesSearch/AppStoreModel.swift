//
//  AppStoreModel.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/7/24.
//

import Foundation

struct AppStoreModel: Decodable {
    
    let results: [AppStoreResult]
}

struct AppStoreResult: Decodable {
    
    let artworkUrl100: String
    let trackCensoredName: String
    let description: String
    let trackName: String
}
