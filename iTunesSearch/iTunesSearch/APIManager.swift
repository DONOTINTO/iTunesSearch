//
//  APIManager.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/7/24.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func callAPI<T: Decodable>(api: AppStoreAPI, type: T.Type, completionHandler: @escaping (Result<T, AFError>) -> Void) {
        
        let url = api.baseURL + api.path
        
        AF.request(url, method: api.method, parameters: api.param, headers: api.header).responseDecodable(of: type) { response in
            
            completionHandler(response.result)
        }
    }
}
