//
//  TabBarViewController.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import Foundation

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupUI()
        selectedIndex = 0
    }

    func setupUI() {
        var controllers: [UIViewController] = []
        for item in NavigationTab.allCases {
            var viewCtr: UIViewController!
            switch item {
            case .dashboard:
                viewCtr = AppViewControllers.dashboard.bindToNavigation()
            case .purchaseHistory:
                viewCtr = AppViewControllers.purchaseHistory.bindToNavigation()
            case .addBook:
                viewCtr = AppViewControllers.addBook.bindToNavigation()
            }
            viewCtr.tabBarItem = item.tabItem
            controllers.append(viewCtr)
        }
        self.viewControllers = controllers
        
    }

}

// MARK: - Navigation Tabs
extension TabBarViewController {
   private enum NavigationTab: Int, CaseIterable {
        case dashboard
        case purchaseHistory
        case addBook
    
        var tabItem: UITabBarItem {
            switch self {
            case .dashboard:
                return UITabBarItem(title: StringConsts.dashboard, image: .init(system: .dashboard), tag: rawValue)
            case .purchaseHistory:
                return UITabBarItem(title: StringConsts.purchaseHistory, image: .init(system: .cart), tag: rawValue)
            case .addBook:
                return UITabBarItem(title: StringConsts.addBook, image: .init(system: .book), tag: rawValue)
            }
        }
    }
}
