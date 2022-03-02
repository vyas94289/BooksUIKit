//
//  UITableView+Extension.swift
//  Populaw
//
//  Created by Gaurang on 14/09/21.
//

import UIKit
import AVFoundation

enum TableViewCellType: String {
    case book    = "BookTableViewCell"
    
    var cellId: String {
        switch self {
        case .book:  return "book_cell"
        }
    }
}

extension UITableView {
    func registerNibCell(type: TableViewCellType) {
        self.register(UINib(nibName: type.rawValue, bundle: nil), forCellReuseIdentifier: type.cellId)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withType cellType: TableViewCellType, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: cellType.cellId, for: indexPath) as! T
    }
    
    func setVerticalContentPadding(_ padding: CGFloat) {
        self.contentInset.top = padding
        self.contentInset.bottom = padding
    }
}

extension UITableViewCell {
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPath = superView.indexPath(for: self)
        return indexPath
    }
}
