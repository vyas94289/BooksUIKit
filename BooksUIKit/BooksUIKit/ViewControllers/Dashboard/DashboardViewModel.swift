//
//  DashboardViewModel.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import Foundation

class DashboardViewModel: BaseViewModel {
    
    var event: ((ViewModelEvent) -> Void)?
    var books: [Book] = []
    
    func startSynching() {
        do {
            books = try DBManager.shared.fetchBooks(false)
            self.emit(.updateDataModel)
        } catch {
            print(error)
            self.emit(.error(message: error.localizedDescription))
        }
    }
    
    func purchaseBook(at index: Int) {
        
    }
    
}
