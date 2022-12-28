//
//  SearchViewController.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/28.
//

import Foundation
import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let searchBar: SearchBar = SearchBar()
    private let repositoryTableView: RepositoryTableView = RepositoryTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    private func layout(){
        
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(repositoryTableView)
        repositoryTableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    
}
