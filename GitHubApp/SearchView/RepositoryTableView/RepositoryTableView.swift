//
//  RepositoryTableView.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/28.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RepositoryTableView: UITableView {
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        attribute()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func attribute(){
//        self.backgroundColor = .white
        self.separatorStyle = .singleLine
        self.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "RepositoryTableViewCell")
        self.rowHeight = 100
        
    }
    
}
