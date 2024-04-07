//
//  AppStoreAPI.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/7/24.
//

import Foundation
import Alamofire

enum AppStoreAPI {
    
    case software(term: String)
    
    var baseURL: String {
        switch self {
        case .software:
            return "https://itunes.apple.com/search?"
        }
    }
    
    var path: String {
        return ""
    }
    
    var param: Alamofire.Parameters {
        switch self {
        case .software(let term):
            return ["term": term, "limit": "10", "media": "software", "country": "KR"]
        }
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var header: HTTPHeaders {
        return [.userAgent("user")]
    }
}
