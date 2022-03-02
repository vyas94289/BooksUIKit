//
//  DBManager+Operation.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import Foundation
import CoreData

extension DBManager {
    
    func fetchBooks(_ isPurchased: Bool) throws -> [Book] {
        let fetchRequest = NSFetchRequest<Book>(entityName: CoreDataConstants.bookEntity)
        fetchRequest.predicate = NSPredicate(format: "\(CoreDataConstants.purchasedKey) == %d", isPurchased)
        return try DBManager.shared.viewContext.fetch(fetchRequest)
    }
}

extension Book {
    func togglePurchase() throws {
        self.purchased.toggle()
        try DBManager.shared.saveContext()
    }
}
