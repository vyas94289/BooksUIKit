//
//  ViewControllers.swift
//  Populaw
//
//  Created by Gaurang on 09/09/21.
//

import UIKit


enum AppViewControllers {
    
    static var dashboard: DashboardViewController {
        getViewController(.main)
    }
    
    static var purchaseHistory: PurchaseHistoryViewController {
        getViewController(.main)
    }
    
    static var addBook: AddBookViewController {
        getViewController(.main)
    }
    
}

extension AppViewControllers {
    
    // MARK: - MARK: - Method to get viewController from storyboard
    static func getViewController<T: UIViewController>(_ storyboard: UIStoryboard.Storyboard) -> T {
        return UIStoryboard(storyboard: storyboard).instantiate()
    }

}
