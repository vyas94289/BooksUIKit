//
//  AppDelegate.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Variables
    static var current: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    var window: UIWindow?
    
    // MARK: - Application life cycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureUI()
        return true
    }
}

// MARK: App Theme Stuff
extension AppDelegate {
    
    private func configureUI() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .lightGray
        window?.tintColor = .purple
        setupKeyboardManager()
        window?.overrideUserInterfaceStyle = .light
        setRootViewController()
        window?.makeKeyAndVisible()
    }
    
    private func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.previousNextDisplayMode = .default
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
    }
    
    func setRootViewController() {
        let viewCtr = TabBarViewController()
        setRootViewController(viewCtr)
    }
    
    func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
}
