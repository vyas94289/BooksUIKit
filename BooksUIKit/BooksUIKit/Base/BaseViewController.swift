//
//  ViewController.swift
//  HJM
//
//  Created by EWW082 on 19/08/19.
//  Copyright © 2019 EWW082. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var messageView: MessageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func showEmptyMessage(_ message: String) {
        messageView?.removeFromSuperview()
        self.messageView = MessageView.getInstance(message)
        guard let messageView = self.messageView else {
            return
        }
        view.addSubview(messageView)
        messageView.setAllSideContraints(.zero)
    }
    
    
    func hideMessageView() {
        guard messageView != nil else {
            return
        }
        messageView?.removeFromSuperview()
        messageView = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func backToHome() {
        self.tabBarController?.selectedIndex = 0
        (self.tabBarController?.viewControllers?.first as? UINavigationController)?.popToRootViewController(animated: true)
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    
}
