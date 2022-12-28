//
//  ViewController.swift
//  GitHubApp
//
//  Created by 임주희 on 2022/12/27.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
    
       
        // -----  탭바 설정 ----- //
        self.delegate = self
        
        /* 탭바 색깔 설정
        self.tabBar.backgroundColor = .darkGray
        self.tabBar.tintColor = .white
        */
        
        let searchView: SearchViewController = SearchViewController()
        let profileView: ProfileViewController = ProfileViewController()
        
        searchView.tabBarItem = UITabBarItem(title: "search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        profileView.tabBarItem = UITabBarItem(title: "profile", image: UIImage(systemName: "person"), tag: 1)
        self.viewControllers = [searchView, profileView]
        
        
        // 로그인 버튼
        let loginButton = UIBarButtonItem(title: NSLocalizedString("Login", comment: ""),
                                        style: .plain,
                                        target: self,
                                        action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItem = loginButton
        
    }
    
    private func attribute(){
        
        
        self.title = "GitHub"
        self.view.backgroundColor = .white
        
    }
    
    
    @objc func loginButtonTapped(){
        print(#fileID, #function)
    }
    @objc func logoutButtonTapped(){
        
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
}
