//
//  BookTableViewCell.swift
//  BooksUIKit
//
//  Created by Gaurang on 28/02/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var expandArrowIcon: UIImageView!
    
    var isExpanded: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descLabel.numberOfLines = 3
        isExpanded = false
    }
    
    func config(_ book: Book) {
        nameLabel.text = book.name
        authorLabel.text = book.author
        priceLabel.text = book.price.toCurrencyFormat()
        descLabel.text = book.desc
    }
    
    func toggleDescription(_ animate: Bool) {
        isExpanded.toggle()
        descLabel.numberOfLines = isExpanded ? 0 : 3
        if animate {
            UIView.animate(withDuration: 0.5, delay: 0,
                           usingSpringWithDamping: 0.5, initialSpringVelocity: 5,
                           options: .curveEaseInOut, animations: {
                            self.expandArrowIcon.transform = self.isExpanded ? .init(rotationAngle: -.pi) : .identity
                           })
        } else {
            self.expandArrowIcon.transform = self.isExpanded ? .init(rotationAngle: -.pi) : .identity
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
    }
}
