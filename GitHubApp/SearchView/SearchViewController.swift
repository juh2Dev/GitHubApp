//
//  SearchViewController.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/28.
//

import Foundation
import UIKit


class SearchViewController: UIViewController {
    
    private let searchBar: SearchBar = SearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    
    private func layout(){
            view.addSubview(searchBar)
            
            view.addSubview(searchBar)
            searchBar.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.equalToSuperview()
            }
            
        }
    
    
}
