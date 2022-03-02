//
//  UITextField+Extension.swift
//  Populaw
//
//  Created by Gaurang on 17/09/21.
//

import UIKit

extension UITextField {
    
    var unwrappedText: String {
        self.text?.trimmed() ?? ""
    }

    var isEmpty: Bool {
        unwrappedText.isEmpty
    }
}
