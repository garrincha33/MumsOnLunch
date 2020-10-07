//
//  MainTabBarController.swift
//  MumsLunch
//
//  Created by Richard Price on 07/10/2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupUI()
    }
    private func setupUI() {
        viewControllers = [
            setupNavigationController(with: RecommendedCollectionViewController(), title: "Recomended", systemItem: UITabBarItem.SystemItem.featured, tag: 0),
            setupNavigationController(with: UIViewController(), title: "Search", systemItem: UITabBarItem.SystemItem.search, tag: 1),
            setupNavigationController(with: UIViewController(), title: "Favorites", systemItem: UITabBarItem.SystemItem.favorites, tag: 2),
        ]
    }
    private func setupNavigationController(with rootViewController: UIViewController, title: String, systemItem: UITabBarItem.SystemItem, tag: Int) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navigationController?.tabBarItem.title = title
        rootViewController.title = title
        navController.tabBarItem.tag = tag
        navController.tabBarItem = UITabBarItem(tabBarSystemItem: systemItem, tag: tag)
        return navController
    }
}
