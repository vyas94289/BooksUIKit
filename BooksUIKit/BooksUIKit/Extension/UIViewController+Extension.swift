//
//  UIViewController+Extension.swift
//  Qwnched-Delivery
//
//  Created by EWW074 - Sj's iMAC on 26/08/20.
//  Copyright © 2020 EWW074. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func bindToNavigation() -> UINavigationController {
       UINavigationController(rootViewController: self)
    }
}

extension UIViewController {
    
    func showConfirmationAlert(title: String?, message: String?, confirmed: @escaping () -> Void) {
        let alertCtr = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertCtr.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            confirmed()
        }))
        alertCtr.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(alertCtr, animated: true)
    }
    
}

