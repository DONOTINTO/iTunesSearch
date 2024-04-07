//
//  APIManager.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/7/24.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

final class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func callAPI<T: Decodable>(api: AppStoreAPI, type: T.Type) -> Observable<T> {
        
        return Observable<T>.create { observer in
            let url = api.baseURL + api.path
            
            AF.request(url, method: api.method, parameters: api.param, headers: api.header).responseDecodable(of: type) { response in
                
                switch response.result {
                    
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(_):
                    observer.onError(APIError.unknownResponse)
                }
            }
            
            return Disposables.create()
        }.debug()
    }
}
