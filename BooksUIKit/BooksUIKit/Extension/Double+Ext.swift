//
//  Double+Ext.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import Foundation

extension Double {
    func toCurrencyFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.currency
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
