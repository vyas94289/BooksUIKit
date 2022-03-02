//
//  UIView+Ext.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func setAllSideContraints(_ insets: UIEdgeInsets) {
        guard let view = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
    }

    func setAllSideContraintsFromSafeArea(_ insets: UIEdgeInsets) {
        guard let view = superview else {
            return
        }
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top).isActive = true
        leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: insets.left).isActive = true
        rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: insets.right).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom).isActive = true
    }

    func setCenterToViewContraints() {
        guard let view = superview else {
            return
        }
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
