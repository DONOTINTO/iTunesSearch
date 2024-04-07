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
        
        let output = BehaviorRelay<[AppStoreResult]>(value: [])
        
        input.event
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .map { AppStoreAPI.software(term: $0) }
            .flatMap {
                APIManager.shared.callAPI(api: $0, type: AppStoreModel.self)
            }
            .subscribe(with: self, onNext: { owner, data in
                output.accept(data.results)
                print("Transform Next")
            }, onError: { _, _ in
                print("Transform Error")
            }).disposed(by: disposeBag)
        
        return Output(event: output)
    }
}
