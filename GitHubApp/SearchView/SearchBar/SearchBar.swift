//
//  SearchBar.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/28.
//

import Foundation
import UIKit
import SnapKit
import RxSwift


class SearchBar: UISearchBar {
    
    
    // 검색버튼
    let searchButton: UIButton = UIButton()
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        attribute()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: SearchBarViewModel){
        
        // 입력한 검색어 -> queryText
        self.rx.text
            .bind(to: viewModel.queryText)
            .disposed(by: disposeBag)
        
        // 키보드 검색버튼 클릭, 검색버튼 클릭 -> searchButtonTapped
        Observable
            .merge(
                self.rx.searchButtonClicked.asObservable(),//키보드의 검색 버튼 클릭
                searchButton.rx.tap.asObservable() //검색버튼 클릭
            )
            .bind(to: viewModel.searchButtonTapped)
            .disposed(by: disposeBag)
        
        
        // 검색버튼 클릭(키보드 검색버튼 클릭, 검색버튼 클릭)이 발생하면, 키보드 내리기
        viewModel.searchButtonTapped
            .asSignal() // UI 계의 PublishSubject, error 방출안함
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
        
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.systemBlue, for: .normal)
        
        self.searchBarStyle = .minimal
    }
    
    private func layout() {
        addSubview(searchButton)
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-12)
            $0.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
}

extension Reactive where Base: SearchBar {
    var endEditing: Binder<Void> {
        return Binder(base) { base, _ in
            base.endEditing(true)
        }
    }
}
