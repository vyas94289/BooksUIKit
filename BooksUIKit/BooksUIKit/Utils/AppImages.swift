//
//  Images.swift
//  Populaw
//
//  Created by Gaurang on 09/09/21.
//

import UIKit
import AVFoundation

enum SystemImages: String {

    // Tabs
    case dashboard  = "books.vertical"
    case cart
    case book       = "text.book.closed"
    
    
}

extension UIImage {
    convenience init(system: SystemImages) {
        self.init(systemName: system.rawValue)!
    }
}
