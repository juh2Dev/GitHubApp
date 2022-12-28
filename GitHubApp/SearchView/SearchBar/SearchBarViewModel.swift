//
//  SearchBarViewModel.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/28.
//

import Foundation
import RxSwift
import RxCocoa


protocol SearchBarViewModelType {
    //INPUT
    var queryText: PublishRelay<String?> { get }
    var searchButtonTapped: PublishRelay<Void> { get }
    
    // OUTPUT
    var shouldLoadResult: Observable<String> { get }
    
}

struct SearchBarViewModel: SearchBarViewModelType {
    
    //INPUT
    
    // 검색바에 입력한 검색어
    let queryText = PublishRelay<String?>()
    
    // SearchBar 내부의 이벤트 (검색 버튼 클릭)
    let searchButtonTapped = PublishRelay<Void>()
    
    // OUTPUT
    
    //SearchBar 외부로 내보낼 이벤트 (검색 이벤트) -> SearchVC로
    var shouldLoadResult = Observable<String>.of("")
    
    
    init(){
        
        //검색버튼 클릭되면 검색어를 SearchVC로 보내기
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText,
                            resultSelector: { _, queryText in
                return queryText ?? "" // 검색어 없으면 ""
            })
            .filter { !$0.isEmpty} // ""이면 안보내
            .distinctUntilChanged() //중복이면 안보내
        
    }
    
}
