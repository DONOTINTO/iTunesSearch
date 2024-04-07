//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by 이중엽 on 4/6/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchResultViewModel {
    
    let disposeBag = DisposeBag()
    
    struct Input {
        let event: BehaviorRelay<String>
    }
    
    struct Output {
        let event: BehaviorRelay<[AppStoreResult]>
    }
    
    func transform(input: Input) -> Output {
        
        var output = BehaviorRelay<[AppStoreResult]>(value: [])
        
        input.event.subscribe(with: self) { owner, search in
            
            let api = AppStoreAPI.software(term: search)
            
            APIManager.shared.callAPI(api: api, type: AppStoreModel.self) { result in
                
                switch result {
                case .success(let success):
                    output.accept(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }
        }.disposed(by: disposeBag)
        
        return Output(event: output)
    }
}
