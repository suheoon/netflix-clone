//
//  ViewController.swift
//  NetflixClone
//
//  Created by Suheon Song on 2023/02/14.
//

import UIKit

class MainTabBarVeiwController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.tabBarItem.title = "홈"
        vc2.tabBarItem.title = "공개 예정"
        vc3.tabBarItem.title = "검색"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2, vc3], animated: true)

    }
}

